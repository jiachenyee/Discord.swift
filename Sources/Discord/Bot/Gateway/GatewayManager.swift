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
            let data = Data(text.utf8)
            
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let code = jsonObject["op"] as? Int,
                  let operation = GatewayOpCode(rawValue: code) else { return }
            
            if let sequence = jsonObject["s"] as? Int {
                self.sequence = sequence
            }
            
            switch operation {
            case .dispatch:
                handleDispatch(jsonObject: jsonObject)
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
    
    func sendIdentifyMessage(task: URLSessionWebSocketTask) async {
        let identifyPayload = GatewayIdentify(identify: .init(token: bot.token,
                                                              compress: false,
                                                              presence: bot.presence,
                                                              intents: bot.intents))
        
        let jsonEncoder = JSONEncoder()
        guard let data = try? jsonEncoder.encode(identifyPayload) else { return }
        
        try? await task.send(.data(data))
    }
    
    func handleDispatch(jsonObject: [String: Any]) {
        guard let typeCode = jsonObject["t"] as? String,
              let event = GatewayEvent(rawValue: typeCode),
              let data = jsonObject["d"] else {
            print("Unrecognised Event:", jsonObject["t"] ?? "")
            return
        }
        
        print(event)
        print(data)
    }
}
