//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

extension GatewayManager {
    func startHeartbeatLoop(heartbeatInterval: Int) {
        Task.detached {
            while true {
                try await self.sendHeartbeatMessage()
                
                let jitter = Double.random(in: 0..<1)
                let nextHeartbeatIntervalMS = Int(Double(heartbeatInterval) * jitter)
                
                try await Task.sleep(for: .milliseconds(nextHeartbeatIntervalMS))
            }
        }
    }
    
    func sendHeartbeatMessage() async throws {
        let jsonEncoder = JSONEncoder()
        let heartbeat = try jsonEncoder.encode(GatewayHeartbeat(sequence: self.sequence))
        
        try await task.send(.data(heartbeat))
    }
}
