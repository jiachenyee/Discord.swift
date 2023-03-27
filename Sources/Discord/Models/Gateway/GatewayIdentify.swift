//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

struct GatewayIdentify: Codable {
    var operation: GatewayOpCode = .identify
    
    var identify: IdentifyPayload
    
    enum CodingKeys: String, CodingKey {
        case operation = "op"
        case identify = "d"
    }
}

struct IdentifyPayload: Codable {
    /// Authentication token
    var token: String
    
    /// Connection properties    -
    var properties: Property
    
    /// Whether this connection supports compression of packets
    var compress: Bool = false
    
    /// Value between 50 and 250, total number of members where the gateway will stop sending offline members in the guild member list
    var largeThreshold: Int = 50
    
    /// array of two integers (`shard_id`, `num_shards`) for guild sharing
    var shard: [Int]?
    
    /// Presence structure for initial presence information
    var presence: Presence?
    
    /// Gateway Intents you wish to receive
    var intents: Intents
    
    init(token: String,
         compress: Bool,
         largeThreshold: Int = 50,
         shard: [Int]? = nil,
         presence: Presence? = nil,
         intents: Intents) {
        self.token = token
        self.properties = Property(os: ProcessInfo.processInfo.operatingSystemVersionString,
                                   browser: "Discord.swift",
                                   device: "Discord.swift")
        self.compress = compress
        self.largeThreshold = largeThreshold
        self.shard = shard
        self.presence = presence
        self.intents = intents
    }
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case properties = "properties"
        case compress = "compress"
        case largeThreshold = "large_threshold"
        case shard = "shard"
        case presence = "presence"
        case intents = "intents"
    }
    
    struct Property: Codable {
        /// Your operating system
        var os: String
        
        /// Your library name
        var browser: String
        
        /// Your library name
        var device: String
    }
}
