//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ScheduledEvent: Codable, GatewayEventData {
    /// the id of the scheduled event
    public var id: Snowflake
    
    /// the guild id which the scheduled event belongs to
    public var guildId: Snowflake
    
    /// the channel id in which the scheduled event will be hosted, or null if scheduled entity type is EXTERNAL
    public var channelId: Snowflake?
    
    /// the id of the user that created the scheduled event *
    public var creatorId: Snowflake?
    
    /// the name of the scheduled event (1-100 characters)
    public var name: String
    
    /// the description of the scheduled event (1-1000 characters)
    public var description: String?
    
    /// the time the scheduled event will start
    public var scheduledStartTime: ISO8601Timestamp?
    
    /// the time the scheduled event will end, required if entity_type is EXTERNAL
    public var scheduledEndTime: ISO8601Timestamp?
     
    /// the privacy level of the scheduled event
    public var privacyLevel: EventPrivacyLevel
    
    /// the status of the scheduled event
    public var status: EventStatus
    
    /// the type of the scheduled event
    public var entityType: GuildScheduledEventEntityType
    
    /// the id of an entity associated with a guild scheduled event
    public var entityId: Snowflake?
    
    /// additional metadata for the guild scheduled event
    public var entityMetadata: EventEntityMetadata?
    
    /// the user that created the scheduled event
    public var creator: User?
    
    /// the number of users subscribed to the scheduled event
    static var userCount: Int?
    
    /// the cover image hash of the scheduled event
    static var image: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case guildId = "guild_id"
        case channelId = "channel_id"
        case creatorId = "creator_id"
        case name = "name"
        case description = "description"
        case scheduledStartTime = "scheduled_start_time"
        case scheduledEndTime = "scheduled_end_time"
        case privacyLevel = "privacy_level"
        case status = "status"
        case entityType = "entity_type"
        case entityId = "entity_id"
        case entityMetadata = "entity_metadata"
        case creator = "creator"
    }
}
