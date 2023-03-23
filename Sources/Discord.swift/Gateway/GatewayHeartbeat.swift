//
//  GatewayHeartbeat.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

struct GatewayHeartbeat: Codable {
    var operation: GatewayOpCode = .heartbeat
    var sequence: Int?
    
    enum CodingKeys: String, CodingKey {
        case operation = "op"
        case sequence = "d"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: GatewayHeartbeat.CodingKeys.self)
        try container.encode(self.operation, forKey: GatewayHeartbeat.CodingKeys.operation)
        try container.encode(self.sequence, forKey: GatewayHeartbeat.CodingKeys.sequence)
    }
}
