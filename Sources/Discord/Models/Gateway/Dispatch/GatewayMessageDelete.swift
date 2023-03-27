//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayMessageDelete: GatewayEventData {
    /// ID of the message
    public var id: Snowflake
    /// ID of the channel
    public var channelId: Snowflake
    /// ID of the guild
    public var guildId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case channelId = "channel_id"
        case guildId = "guild_id"
    }
}
