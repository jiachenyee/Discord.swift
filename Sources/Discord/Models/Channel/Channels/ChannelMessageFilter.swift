//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation
import Alamofire

public struct ChannelMessageFilter: Parameterable {
    /// Get messages around this message ID
    public var around: Snowflake?
    
    /// Get messages before this message ID
    public var before: Snowflake?
    
    /// Get messages after this message ID
    public var after: Snowflake?
    
    /// Max number of messages to return (1-100)
    public var limit: Int?
    
    public init(around: Snowflake? = nil, before: Snowflake? = nil, after: Snowflake? = nil, limit: Int? = nil) {
        self.around = around
        self.before = before
        self.after = after
        self.limit = limit
    }
    
    public static func filters(around: Snowflake? = nil,
                               before: Snowflake? = nil,
                               after: Snowflake? = nil,
                               limit: Int? = nil) -> Self {
        Self(around: around,
             before: before,
             after: after,
             limit: limit)
    }
}
