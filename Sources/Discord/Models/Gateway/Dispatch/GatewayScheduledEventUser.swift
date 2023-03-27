//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayScheduledEventUser: GatewayEventData {
    /// ID of the guild scheduled event
    public var guildScheduledEventId: Snowflake
    /// ID of the user
    public var userId: Snowflake
    /// ID of the guild
    public var guildId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case guildScheduledEventId = "guild_scheduled_event_id"
        case userId = "user_id"
        case guildId = "guild_id"
    }
}
