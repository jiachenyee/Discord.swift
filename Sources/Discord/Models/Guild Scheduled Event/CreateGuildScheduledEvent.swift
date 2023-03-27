//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct CreateGuildScheduledEvent: Codable {
    /// the channel id of the scheduled event.
    public var channelId: Snowflake?
    
    /// the entity metadata of the scheduled event
    public var entityMetadata: EventEntityMetadata?
    
    /// the name of the scheduled event
    public var name: String
    
    /// the privacy level of the scheduled event
    public var privacyLevel: EventPrivacyLevel
    
    /// the time to schedule the scheduled event
    public var scheduledStartTime: ISO8601Timestamp
    
    /// the time when the scheduled event is scheduled to end
    public var scheduledEndTime: ISO8601Timestamp?
    
    /// the description of the scheduled event
    public var description: String?
    
    /// the entity type of the scheduled event
    public var entityType: GuildScheduledEventEntityType
    
    /// the cover image of the scheduled event
    public var image: Data?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case entityMetadata = "entity_metadata"
        case name = "name"
        case privacyLevel = "privacy_level"
        case scheduledStartTime = "scheduled_start_time"
        case scheduledEndTime = "scheduled_end_time"
        case description = "description"
        case entityType = "entity_type"
        case image = "image"
    }
    
    public init(channelId: Snowflake? = nil,
                entityMetadata: EventEntityMetadata? = nil,
                name: String, privacyLevel: EventPrivacyLevel,
                scheduledStartTime: ISO8601Timestamp,
                scheduledEndTime: ISO8601Timestamp? = nil,
                description: String? = nil,
                entityType: GuildScheduledEventEntityType,
                image: Data? = nil) {
        self.channelId = channelId
        self.entityMetadata = entityMetadata
        self.name = name
        self.privacyLevel = privacyLevel
        self.scheduledStartTime = scheduledStartTime
        self.scheduledEndTime = scheduledEndTime
        self.description = description
        self.entityType = entityType
        self.image = image
    }
    
    public static func stageChannel(channelId: Snowflake,
                                    name: String,
                                    privacyLevel: EventPrivacyLevel = .guildOnly,
                                    scheduledStartTime: ISO8601Timestamp,
                                    scheduledEndTime: ISO8601Timestamp? = nil,
                                    description: String? = nil,
                                    image: Data? = nil) -> Self {
        Self(channelId: channelId,
             name: name,
             privacyLevel: privacyLevel,
             scheduledStartTime: scheduledStartTime,
             scheduledEndTime: scheduledEndTime,
             description: description,
             entityType: .stageInstance,
             image: image)
    }
    
    public static func voiceChannel(channelId: Snowflake,
                                    name: String,
                                    privacyLevel: EventPrivacyLevel = .guildOnly,
                                    scheduledStartTime: ISO8601Timestamp,
                                    scheduledEndTime: ISO8601Timestamp? = nil,
                                    description: String? = nil,
                                    image: Data? = nil) -> Self {
        Self(channelId: channelId,
             name: name,
             privacyLevel: privacyLevel,
             scheduledStartTime: scheduledStartTime,
             scheduledEndTime: scheduledEndTime,
             description: description,
             entityType: .voice,
             image: image)
    }
    
    public static func external(name: String,
                                location: String,
                                privacyLevel: EventPrivacyLevel = .guildOnly,
                                scheduledStartTime: ISO8601Timestamp,
                                scheduledEndTime: ISO8601Timestamp,
                                description: String? = nil,
                                image: Data? = nil) -> Self {
        Self(entityMetadata: EventEntityMetadata(location: location),
             name: name,
             privacyLevel: privacyLevel,
             scheduledStartTime: scheduledStartTime,
             scheduledEndTime: scheduledEndTime,
             description: description,
             entityType: .external,
             image: image)
    }
}
