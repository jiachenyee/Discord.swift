//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ReactionFilter: Parameterable {
    /// Get users after this user ID    absent
    public var after: Snowflake?
    /// Max number of users to return (1-100)    25
    public var limit: Int?
    
    public init(after: Snowflake? = nil, limit: Int? = nil) {
        self.after = after
        self.limit = limit
    }
    
    public static func filter(after: Snowflake? = nil,
                              limit: Int? = nil) -> Self {
        Self(after: after,
             limit: limit)
    }
}
