//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ScheduledEventUser: Codable {
    /// the scheduled event id which the user subscribed to
    public var guildScheduledEventId: Snowflake
    
    /// user which subscribed to an event
    public var user: User
    
    /// guild member data for this user for the guild which this event belongs to, if any
    public var member: GuildMember?
    
    enum CodingKeys: String, CodingKey {
        case guildScheduledEventId = "guild_scheduled_event_id"
        case user = "user"
        case member = "member"
    }
}
