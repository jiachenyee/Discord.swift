//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct MessageReference: Codable {
    /// id of the originating message
    public var messageId: Snowflake?
    
    /// id of the originating message's channel
    public var channelId: Snowflake?
    
    /// id of the originating message's guild
    public var guildId: Snowflake?
    
    /// when sending, whether to error if the referenced message doesn't exist instead of sending as a normal (non-reply) message, default true
    public var failIfNotExists: Bool?
    
    enum CodingKeys: String, CodingKey {
        case messageId = "message_id"
        case channelId = "channel_id"
        case guildId = "guild_id"
        case failIfNotExists = "fail_if_not_exists"
    }
    
    public init(messageId: Snowflake? = nil,
                channelId: Snowflake? = nil,
                guildId: Snowflake? = nil,
                failIfNotExists: Bool? = nil) {
        self.messageId = messageId
        self.channelId = channelId
        self.guildId = guildId
        self.failIfNotExists = failIfNotExists
    }
}
