//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct WebhookUpdate: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    
    /// ID of the channel
    public var channelId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case channelId = "channel_id"
    }
}
