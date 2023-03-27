//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildIntegration: GatewayEventData {
    /// ID of the guild whose integrations were updated
    public var guildId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
    }
}
