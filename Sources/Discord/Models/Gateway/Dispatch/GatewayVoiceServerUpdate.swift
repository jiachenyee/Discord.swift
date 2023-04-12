//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayVoiceServerUpdate: GatewayEventData {
    /// Voice connection token
    public var token: String?
    /// Guild this voice server update is for
    public var guildId: Snowflake
    /// Voice server host
    public var endpoint: String?
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case guildId = "guild_id"
        case endpoint = "endpoint"
    }
}
