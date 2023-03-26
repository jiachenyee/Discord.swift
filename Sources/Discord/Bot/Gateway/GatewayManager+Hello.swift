//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

extension GatewayManager {
    func handleHello(jsonObject: [String: Any]) async {
        guard let data = jsonObject["d"] as? [String: Any],
              let heartbeatInterval = data["heartbeat_interval"] as? Int else { return }
        
        startHeartbeatLoop(heartbeatInterval: heartbeatInterval)
        
        await sendIdentifyMessage(task: task)
    }
}
