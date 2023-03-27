//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct ChannelPinsUpdate: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake?
    
    /// ID of the channel
    public var channelId: Snowflake
    
    /// Time at which the most recent pinned message was pinned
    public var lastPinTimestamp: ISO8601Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case channelId = "channel_id"
        case lastPinTimestamp = "last_pin_timestamp"
    }
}
