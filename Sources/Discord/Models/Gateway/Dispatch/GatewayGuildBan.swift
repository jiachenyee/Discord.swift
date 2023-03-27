//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildBan: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    
    /// User who was banned
    public var user: User
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case user = "user"
    }
}
