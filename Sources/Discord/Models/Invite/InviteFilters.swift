//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct InviteFilters: Parameterable {
    /// whether the invite should contain approximate member counts
    public var withCounts: Bool?
    
    /// whether the invite should contain the expiration date
    public var withExpiration: Bool?
    
    /// the guild scheduled event to include with the invite
    public var guildScheduledEventId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case withCounts = "with_counts"
        case withExpiration = "with_expiration"
        case guildScheduledEventId = "guild_scheduled_event_id"
    }
    
    public init(withCounts: Bool? = nil,
                withExpiration: Bool? = nil,
                guildScheduledEventId: Snowflake? = nil) {
        self.withCounts = withCounts
        self.withExpiration = withExpiration
        self.guildScheduledEventId = guildScheduledEventId
    }
    
    public static func using(withCounts: Bool? = nil,
                             withExpiration: Bool? = nil,
                             guildScheduledEventId: Snowflake? = nil) -> Self {
        Self(withCounts: withCounts,
             withExpiration: withExpiration,
             guildScheduledEventId: guildScheduledEventId)
    }
}
