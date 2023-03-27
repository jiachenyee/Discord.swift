//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AuditLog: Codable {
    /// List of application commands referenced in the audit log
    public var applicationCommands: [Command]
    
    /// List of audit log entries, sorted from most to least recent
    public var auditLogEntries: [AuditLogEntry]
    
    /// List of auto moderation rules referenced in the audit log
    public var autoModerationRules: [AutoModerationRule]
    
    /// List of guild scheduled events referenced in the audit log
    public var guildScheduledEvents: [ScheduledEvent]
    
    /// List of partial integration objects
    public var integrations: [Integration]
    
    /// List of threads referenced in the audit log*
    public var threads: [Channel]
    
    /// List of users referenced in the audit log
    public var users: [User]
    
    /// List of webhooks referenced in the audit log
    public var webhooks: [Webhook]
    
    enum CodingKeys: String, CodingKey {
        case applicationCommands = "application_commands"
        case auditLogEntries = "audit_log_entries"
        case autoModerationRules = "auto_moderation_rules"
        case guildScheduledEvents = "guild_scheduled_events"
        case integrations = "integrations"
        case threads = "threads"
        case users = "users"
        case webhooks = "webhooks"
    }
}
