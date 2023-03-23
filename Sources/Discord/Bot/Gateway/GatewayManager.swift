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
    
    var bot: Bot
    
    var task: URLSessionWebSocketTask!
    
    init(bot: Bot) {
        self.bot = bot
    }
    
    func connect() {
        task = URLSession.shared.webSocketTask(with: gatewayURL)
        task.resume()
        
        Task.detached {
            while true {
                await self.receive()
            }
        }
    }
    
    func receive() async {
        let message = try! await task.receive()
        switch message {
        case .string(let text):
            print("Received message: \(text)")
            let data = Data(text.utf8)
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let code = jsonObject["op"] as? Int,
                  let operation = GatewayOpCode(rawValue: code) else { return }
            
            if let sequence = jsonObject["s"] as? Int {
                self.sequence = sequence
            }
            
            switch operation {
            case .dispatch:
                print("Dispatch")
            case .heartbeat:
                try? await sendHeartbeatMessage()
            case .reconnect:
                print("Reconnect")
            case .invalidSession:
                print("Invalid")
            case .hello:
                await handleHello(jsonObject: jsonObject)
            case .heartbeatACK:
                break
            default: break
            }
        default: break
        }
    }
    
    func handleHello(jsonObject: [String: Any]) async {
        guard let data = jsonObject["d"] as? [String: Any],
              let heartbeatInterval = data["heartbeat_interval"] as? Int else { return }
        
        startHeartbeatLoop(heartbeatInterval: heartbeatInterval)
        
        await sendIdentifyMessage(task: task)
    }
    
    func sendIdentifyMessage(task: URLSessionWebSocketTask) async {
        let identifyPayload = GatewayIdentify(identify: .init(token: bot.token,
                                                              compress: false,
                                                              presence: bot.presence,
                                                              intents: bot.intents))
        
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(identifyPayload) else { return }
        
        try? await task.send(.data(data))
    }
}