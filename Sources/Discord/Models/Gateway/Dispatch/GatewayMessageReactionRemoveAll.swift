//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayMessageReactionRemoveAll: GatewayEventData {
    /// ID of the channel
    public var channelId: Snowflake
    /// ID of the message
    public var messageId: Snowflake
    /// ID of the guild
    public var guildId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case messageId = "message_id"
        case guildId = "guild_id"
    }
}
