//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildRole: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    /// Role that was created
    public var role: Role
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case role = "role"
    }
}
