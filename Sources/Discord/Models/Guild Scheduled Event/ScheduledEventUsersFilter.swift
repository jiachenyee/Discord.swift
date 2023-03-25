//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ScheduledEventUsersFilter: Parameterable {
    /// number of users to return (up to maximum 100)
    var limit: Int?
    
    /// include guild member data if it exists
    var withMember: Bool?
    
    /// consider only users before given user id
    var before: Snowflake?
    
    /// consider only users after given user id
    var after: Snowflake?
    
    public init(limit: Int? = nil,
                withMember: Bool? = nil,
                before: Snowflake? = nil,
                after: Snowflake? = nil) {
        self.limit = limit
        self.withMember = withMember
        self.before = before
        self.after = after
    }
    
    enum CodingKeys: String, CodingKey {
        case limit = "limit"
        case withMember = "with_member"
        case before = "before"
        case after = "after"
    }
    
    public static func using(limit: Int? = nil,
                             withMember: Bool? = nil,
                             before: Snowflake? = nil,
                             after: Snowflake? = nil) -> Self {
        Self(limit: limit,
             withMember: withMember,
             before: before,
             after: after)
    }
}
