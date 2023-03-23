//
//  AuditLogEntry.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AuditLogEntry: Codable {
    
    /// ID of the affected entity (webhook, user, role, etc.)
    public var targetId: String?
    
    /// Changes made to the targetId
    public var changes: [AuditLogChange]?
    
    /// User or app that made the changes
    public var userId: Snowflake?
    
    /// ID of the entry
    public var id: Snowflake
    
    /// Type of action that occurred
    public var actionType: AuditLogEvent
    
    /// Additional info for certain event types
    public var options: OptionalAuditEntryInfo?
    
    /// Reason for the change (1-512 characters)
    public var reason: String?
    
    enum CodingKeys: String, CodingKey {
        case targetId = "target_id"
        case changes = "changes"
        case userId = "user_id"
        case id = "id"
        case actionType = "action_type"
        case options = "options"
        case reason = "reason"
    }
}
