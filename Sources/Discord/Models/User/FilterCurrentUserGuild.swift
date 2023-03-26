//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct FilterCurrentUserGuild: Parameterable {
    /// get guilds before this guild ID
    public var before: Snowflake?
    
    /// get guilds after this guild ID
    public var after: Snowflake?
    
    /// max number of guilds to return (1-200)
    public var limit: Int?
    
    init(before: Snowflake? = nil, after: Snowflake? = nil, limit: Int? = nil) {
        self.before = before
        self.after = after
        self.limit = limit
    }
    
    public func filter(before: Snowflake? = nil,
                       after: Snowflake? = nil,
                       limit: Int? = nil) -> Self {
        Self(before: before,
             after: after,
             limit: limit)
    }
}
