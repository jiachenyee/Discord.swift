//
//  GatewayManager.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

class GatewayManager {
    let gatewayURL = URL(string: "wss://gateway.discord.gg/?v=10&encoding=json")!
    var sequence: Int?
    
    var ready: GatewayReady?
    
    var bot: Bot
    
    var task: URLSessionWebSocketTask!
    
    var previousIdentify: Date?
    
    var isHeartbeatLoopRunning = false
    
    init(bot: Bot) {
        self.bot = bot
    }
    
    func connect() {
        let url = URL(string: ready?.resumeGatewayURL ?? "wss://gateway.discord.gg/?v=10&encoding=json") ?? gatewayURL
        
        task = URLSession.shared.webSocketTask(with: url)
        task.resume()
        
        Task.detached {
            while true {
                while true {
                    if await !self.receive() { break }
                }
                
                self.task.cancel()
                
                self.handleReconnect()
                print("Task failed")
            }
        }
    }
    
    func receive() async -> Bool {
        // swiftlint:disable force_try
        let message = try! await task.receive() 
        // swiftlint:enable force_try
        switch message {
        case .string(let text):
            let data = Data(text.utf8)
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let code = jsonObject["op"] as? Int,
                  let operation = GatewayOpCode(rawValue: code) else { return true }
            
            if let sequence = jsonObject["s"] as? Int {
                self.sequence = sequence
            }
            
            switch operation {
            case .dispatch:
                handleDispatch(jsonObject: jsonObject)
            case .heartbeat:
                try? await sendHeartbeatMessage()
            case .reconnect:
                handleReconnect()
                print("Received reconnect req")
            case .invalidSession:
                handleReconnect()
                print("Invalid session")
            case .hello:
                await handleHello(jsonObject: jsonObject)
            case .heartbeatACK:
                break
            default:
                print("Unhandled event")
            }
        default: break
        }
        
        return true
    }
    
    func handleReconnect() {
        guard let ready else { return }
        
        print("Reconnect")
        
        let resume = GatewayResume(data: .init(token: bot.token,
                                               sessionId: ready.sessionId,
                                               sequence: sequence!))
        
        task.cancel()
        
        connect()
        
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(resume) else { return }
        
        Task {
            try? await task.send(.data(data))
        }
    }
    
    func sendIdentifyMessage(task: URLSessionWebSocketTask) async {
        guard abs((previousIdentify ?? .distantPast).timeIntervalSinceNow) > 20 else { return }
        
        let identifyPayload = GatewayIdentify(identify: .init(token: bot.token,
                                                              compress: false,
                                                              presence: bot.presence,
                                                              intents: bot.intents))
        
        print("identify")
        
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(identifyPayload) else { return }
        
        try? await task.send(.data(data))
    }
}
