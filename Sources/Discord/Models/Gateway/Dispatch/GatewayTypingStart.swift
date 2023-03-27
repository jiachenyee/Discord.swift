//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayTypingStart: GatewayEventData {
    /// ID of the channel
    public var channelId: Snowflake
    
    /// ID of the guild
    public var guildId: Snowflake?
    
    /// ID of the user
    public var userId: Snowflake
    
    /// Unix time (in seconds) of when the user started typing
    public var timestamp: Int
    
    /// Member who started typing if this happened in a guild
    public var member: GuildMember?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case guildId = "guild_id"
        case userId = "user_id"
        case timestamp = "timestamp"
        case member = "member"
    }
}
