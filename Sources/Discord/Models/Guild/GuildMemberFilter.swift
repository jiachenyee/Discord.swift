//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildMemberFilter: Parameterable {
    /// max number of members to return (1-1000), defaults to 1
    public var limit: Int?
    
    /// the highest user id in the previous page
    public var after: Snowflake?
    
    init(limit: Int? = nil, after: Snowflake? = nil) {
        self.limit = limit
        self.after = after
    }
    
    public static func using(limit: Int? = nil,
                             after: Snowflake? = nil) -> Self {
        Self(limit: limit,
             after: after)
    }
}
