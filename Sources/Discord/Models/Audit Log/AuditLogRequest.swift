//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AuditLogFilters: Codable {
    /// Entries from a specific user ID
    public var userId: Snowflake?
    
    /// Entries for a specific audit log event
    public var actionType: AuditLogEvent?
    
    /// Entries with ID less than a specific audit log entry ID
    public var before: Snowflake?
    
    /// Entries with ID greater than a specific audit log entry ID
    public var after: Snowflake?
    
    /// Maximum number of entries (between 1-100) to return, defaults to 50
    public var limit: Int?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case actionType = "action_type"
        case before = "before"
        case after = "after"
        case limit = "limit"
    }
    
    public init(userId: Snowflake? = nil,
                actionType: AuditLogEvent? = nil,
                before: Snowflake? = nil,
                after: Snowflake? = nil,
                limit: Int? = nil) {
        self.userId = userId
        self.actionType = actionType
        self.before = before
        self.after = after
        self.limit = limit
    }
}
