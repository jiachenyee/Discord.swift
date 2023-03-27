//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildMemberRemove: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    
    /// User who was removed
    public var user: User
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case user = "user"
    }
}
