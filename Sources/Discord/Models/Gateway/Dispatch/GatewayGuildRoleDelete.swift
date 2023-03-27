//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildRoleDelete: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    /// ID of the role
    public var roleId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case roleId = "role_id"
    }
}
