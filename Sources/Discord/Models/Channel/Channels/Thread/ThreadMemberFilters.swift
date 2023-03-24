//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ThreadMemberFilters: Codable, Parameterable {
    /// Whether to include a guild member object for each thread member
    public var withGuildMember: Bool?
    
    /// Get thread members after this user ID
    public var after: Snowflake?
    
    /// Max number of thread members to return (1-100). Defaults to 100.
    public var limit: Int?
    
    enum CodingKeys: String, CodingKey {
        case withGuildMember = "with_member"
        case after = "after"
        case limit = "limit"
    }
    
    init(withGuildMember: Bool? = nil,
         after: Snowflake? = nil,
         limit: Int? = nil) {
        self.withGuildMember = withGuildMember
        self.after = after
        self.limit = limit
    }
    
    public static func using(withGuildMember: Bool? = nil,
                             after: Snowflake? = nil,
                             limit: Int? = nil) -> Self {
        Self(withGuildMember: withGuildMember,
             after: after,
             limit: limit)
    }
}
