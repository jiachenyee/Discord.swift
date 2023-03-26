//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AuditLog: Codable {
    /// List of application commands referenced in the audit log
    public var application_commands: [Command]
    
    /// List of audit log entries, sorted from most to least recent
    public var audit_log_entries: [AuditLogEntry]
    
    /// List of auto moderation rules referenced in the audit log
    public var auto_moderation_rules: [AutoModerationRule]
    
    /// List of guild scheduled events referenced in the audit log
    public var guild_scheduled_events: [ScheduledEvent]
    
    /// List of partial integration objects
    public var integrations: [Integration]
    
    /// List of threads referenced in the audit log*
    public var threads: [Channel]
    
    /// List of users referenced in the audit log
    public var users: [User]
    
    /// List of webhooks referenced in the audit log
    public var webhooks: [Webhook]
}
