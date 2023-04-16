//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

extension GatewayManager {
    func startHeartbeatLoop(heartbeatInterval: Int) {
        heartbeatTask = Task {
            try await self.sendHeartbeatMessage()
            
            let jitter = Double.random(in: 0..<1)
            let nextHeartbeatIntervalMS = Int(Double(heartbeatInterval) * jitter)
            print("heartbeat at", Date.now)
            try await Task.sleep(for: .milliseconds(nextHeartbeatIntervalMS))
            
            if !(task?.progress.isCancelled ?? true) {
                startHeartbeatLoop(heartbeatInterval: heartbeatInterval)
            } else {
                print("Task prematurely cancelled")
            }
        }
    }
    
    func sendHeartbeatMessage() async throws {
        let jsonEncoder = JSONEncoder()
        let heartbeat = try jsonEncoder.encode(GatewayHeartbeat(sequence: self.sequence))
        
        try await task?.send(.data(heartbeat))
    }
}
