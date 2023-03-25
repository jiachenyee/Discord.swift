//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct GuildBanFilter: Parameterable {
    /// number of users to return (up to maximum 1000)
    public var limit: Int?
    
    /// consider only users before given user id
    public var before: Snowflake?
    
    /// consider only users after given user id    null
    public var after: Snowflake?
    
    init(limit: Int? = nil, before: Snowflake? = nil, after: Snowflake? = nil) {
        self.limit = limit
        self.before = before
        self.after = after
    }
    
    public static func using(limit: Int? = nil,
                             before: Snowflake? = nil,
                             after: Snowflake? = nil) -> Self {
        Self(limit: limit,
             before: before,
             after: after)
    }
}
