//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayThreadMember: GatewayEventData {
    /// ID of the thread
    public var id: Snowflake?
    
    /// ID of the user
    public var userId: Snowflake?
    
    /// Time the user last joined the thread
    public var joinTimestamp: ISO8601Timestamp
    
    /// Any user-thread settings, currently only used for notifications
    public var flags: Int
    
    /// Additional information about the user
    public var member: GuildMember?
    
    /// ID of the guild
    public var guildId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userId = "user_id"
        case joinTimestamp = "join_timestamp"
        case flags = "flags"
        case member = "member"
        case guildId = "guild_id"
    }
}
