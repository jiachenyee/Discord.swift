//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayMessageReactionAdd: GatewayEventData {
    /// ID of the user
    public var userId: Snowflake
    /// ID of the channel
    public var channelId: Snowflake
    /// ID of the message
    public var messageId: Snowflake
    /// ID of the guild
    public var guildId: Snowflake?
    /// Member who reacted if this happened in a guild
    public var member: GuildMember?
    /// Emoji used to react - example
    public var emoji: Emoji
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case channelId = "channel_id"
        case messageId = "message_id"
        case guildId = "guild_id"
        case member = "member"
        case emoji = "emoji"
    }
}
