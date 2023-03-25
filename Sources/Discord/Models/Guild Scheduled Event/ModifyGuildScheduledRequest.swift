//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ModifyGuildScheduledRequest: Codable {
    /// the channel id of the scheduled event.
    public var channelId: Snowflake?
    
    /// the entity metadata of the scheduled event
    public var entityMetadata: EventEntityMetadata?
    
    /// the name of the scheduled event
    public var name: String?
    
    /// the privacy level of the scheduled event
    public var privacyLevel: EventPrivacyLevel?
    
    /// the time to schedule the scheduled event
    public var scheduledStartTime: ISO8601Timestamp?
    
    /// the time when the scheduled event is scheduled to end
    public var scheduledEndTime: ISO8601Timestamp?
    
    /// the description of the scheduled event
    public var description: String?
    
    /// the entity type of the scheduled event
    public var entityType: GuildScheduledEventEntityType?
    
    /// the status of the scheduled event
    public var status: EventStatus?
    
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
        case status = "status"
        case image = "image"
    }
    
    public init(channelId: Snowflake? = nil,
                entityMetadata: EventEntityMetadata? = nil,
                name: String? = nil,
                privacyLevel: EventPrivacyLevel? = nil,
                scheduledStartTime: ISO8601Timestamp? = nil,
                scheduledEndTime: ISO8601Timestamp? = nil,
                description: String? = nil,
                entityType: GuildScheduledEventEntityType? = nil,
                status: EventStatus? = nil,
                image: Data? = nil) {
        self.channelId = channelId
        self.entityMetadata = entityMetadata
        self.name = name
        self.privacyLevel = privacyLevel
        self.scheduledStartTime = scheduledStartTime
        self.scheduledEndTime = scheduledEndTime
        self.description = description
        self.entityType = entityType
        self.status = status
        self.image = image
    }
    
    public static func stageChannel(channelId: Snowflake? = nil,
                                    name: String? = nil,
                                    privacyLevel: EventPrivacyLevel? = nil,
                                    scheduledStartTime: ISO8601Timestamp? = nil,
                                    scheduledEndTime: ISO8601Timestamp? = nil,
                                    description: String? = nil,
                                    status: EventStatus? = nil,
                                    image: Data? = nil) -> Self {
        Self(channelId: channelId,
             name: name,
             privacyLevel: privacyLevel,
             scheduledStartTime: scheduledStartTime,
             scheduledEndTime: scheduledEndTime,
             description: description,
             entityType: .stageInstance,
             status: status,
             image: image)
    }
    
    public static func voiceChannel(channelId: Snowflake? = nil,
                                    name: String? = nil,
                                    privacyLevel: EventPrivacyLevel? = nil,
                                    scheduledStartTime: ISO8601Timestamp? = nil,
                                    scheduledEndTime: ISO8601Timestamp? = nil,
                                    description: String? = nil,
                                    status: EventStatus? = nil,
                                    image: Data? = nil) -> Self {
        Self(channelId: channelId,
             name: name,
             privacyLevel: privacyLevel,
             scheduledStartTime: scheduledStartTime,
             scheduledEndTime: scheduledEndTime,
             description: description,
             entityType: .stageInstance,
             status: status,
             image: image)
    }
    
    public static func external(name: String? = nil,
                                location: String? = nil,
                                privacyLevel: EventPrivacyLevel? = nil,
                                scheduledStartTime: ISO8601Timestamp? = nil,
                                scheduledEndTime: ISO8601Timestamp? = nil,
                                description: String? = nil,
                                status: EventStatus? = nil,
                                image: Data? = nil) -> Self {
        if let location {
            return Self(entityMetadata: EventEntityMetadata(location: location),
                        name: name,
                        privacyLevel: privacyLevel,
                        scheduledStartTime: scheduledStartTime,
                        scheduledEndTime: scheduledEndTime,
                        description: description,
                        entityType: .external,
                        status: status,
                        image: image)
        } else {
            return Self(name: name,
                        privacyLevel: privacyLevel,
                        scheduledStartTime: scheduledStartTime,
                        scheduledEndTime: scheduledEndTime,
                        description: description,
                        entityType: .external,
                        status: status,
                        image: image)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        if entityType == .external {
            try container.encode(self.channelId, forKey: .channelId)
        } else {
            try container.encodeIfPresent(self.channelId, forKey: .channelId)
        }
        
        try container.encodeIfPresent(self.channelId, forKey: .channelId)
        try container.encodeIfPresent(self.entityMetadata, forKey: .entityMetadata)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.privacyLevel, forKey: .privacyLevel)
        try container.encodeIfPresent(self.scheduledStartTime, forKey: .scheduledStartTime)
        try container.encodeIfPresent(self.scheduledEndTime, forKey: .scheduledEndTime)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.entityType, forKey: .entityType)
        try container.encodeIfPresent(self.status, forKey: .status)
        try container.encodeIfPresent(self.image, forKey: .image)
    }
}
