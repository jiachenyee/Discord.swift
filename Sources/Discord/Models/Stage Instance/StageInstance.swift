//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct StageInstance: Codable {
    /// The id of this Stage instance
    public var id: Snowflake
    
    /// The guild id of the associated Stage channel
    public var guildId: Snowflake
    
    /// The id of the associated Stage channel
    public var channelId: Snowflake
    
    /// The topic of the Stage instance (1-120 characters)
    public var topic: String
    
    /// The privacy level of the Stage instance
    public var privacyLevel: StagePrivacyLevel
    
    /// The id of the scheduled event for this Stage instance
    public var guildScheduledEventId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case guildId = "guild_id"
        case channelId = "channel_id"
        case topic = "topic"
        case privacyLevel = "privacy_level"
        case guildScheduledEventId = "guild_scheduled_event_id"
    }
    
    public init(id: Snowflake,
                guildId: Snowflake,
                channelId: Snowflake,
                topic: String,
                privacyLevel: StagePrivacyLevel = .guildOnly,
                guildScheduledEventId: Snowflake? = nil) {
        self.id = id
        self.guildId = guildId
        self.channelId = channelId
        self.topic = topic
        self.privacyLevel = privacyLevel
        self.guildScheduledEventId = guildScheduledEventId
    }
}
