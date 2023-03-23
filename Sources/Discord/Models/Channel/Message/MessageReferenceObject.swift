//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct MessageReferenceObject: Codable {
    /// id of the originating message
    var messageId: Snowflake?
    
    /// id of the originating message's channel
    var channelId: Snowflake?
    
    /// id of the originating message's guild
    var guildId: Snowflake?
    
    /// when sending, whether to error if the referenced message doesn't exist instead of sending as a normal (non-reply) message, default true
    var failIfNotExists: Bool?
    
    enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
        case channelId = "channel_id"
        case guildId = "guild_id"
        case failIfNotExists = "fail_if_not_exists"
    }
}
