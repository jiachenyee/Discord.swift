//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ScheduledEvent {
    /// the id of the scheduled event
    public var id: Snowflake
    
    /// the guild id which the scheduled event belongs to
    public var guild_id: Snowflake
    
    /// the channel id in which the scheduled event will be hosted, or null if scheduled entity type is EXTERNAL
    public var channel_id: Snowflake?
    
    /// the id of the user that created the scheduled event *
    public var creator_id: Snowflake?
    
    /// the name of the scheduled event (1-100 characters)
    public var name: String
    
    /// the description of the scheduled event (1-1000 characters)
    public var description: String?
    
    /// the time the scheduled event will start
    public var scheduled_start_time: ISO8601Timestamp?
    
    /// the time the scheduled event will end, required if entity_type is EXTERNAL
    public var scheduled_end_time: ISO8601Timestamp?
     
    /// the privacy level of the scheduled event
    public var privacy_level: EventPrivacyLevel
    
    /// the status of the scheduled event
    public var status: EventStatus
    
    /// the type of the scheduled event
    public var entity_type: GuildScheduledEventEntityType
    
    /// the id of an entity associated with a guild scheduled event
    public var entity_id: Snowflake?
    
    /// additional metadata for the guild scheduled event
    public var entity_metadata: EventEntityMetadata?
    
    /// the user that created the scheduled event
    public var creator: User?
    
    /// the number of users subscribed to the scheduled event
    static var user_count: Int?
    
    /// the cover image hash of the scheduled event
    static var image: String?
}

public enum EventPrivacyLevel: Int, Codable {
    /// the scheduled event is only accessible to guild members
    case guildOnly = 2
}

public enum GuildScheduledEventEntityType: Int, Codable {
    case stageInstance = 1
    case voice = 2
    case external = 3
}

public enum EventStatus: Int, Codable {
    case SCHEDULED = 1
    case ACTIVE = 2
    case COMPLETED = 3
    case CANCELED = 4
}

public struct EventEntityMetadata: Codable {
    /// location of the event (1-100 characters)
    public var location: String?
}

public struct ScheduledEventUser: Codable {
    /// the scheduled event id which the user subscribed to
    public var guild_scheduled_event_id: Snowflake
    
    /// user which subscribed to an event
    public var user: User
    
    /// guild member data for this user for the guild which this event belongs to, if any
    public var member: GuildMember?
}
