//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

#warning("Incomplete implementation")
public struct AuditLog: Codable {
    /// List of application commands referenced in the audit log
    public var application_commands: [Command]
    /// List of audit log entries, sorted from most to least recent
    public var audit_log_entries: [AuditLogEntry]
    /// array of auto moderation rule objects    List of auto moderation rules referenced in the audit log
//    public var auto_moderation_rules
//    /// array of guild scheduled event objects    List of guild scheduled events referenced in the audit log
//    public var guild_scheduled_events
//    /// array of partial integration objects    List of partial integration objects
//    public var integrations
//    /// array of thread-specific channel objects    List of threads referenced in the audit log*
//    public var threads
//    /// array of user objects    List of users referenced in the audit log
//    public var users
//    /// array of webhook objects    List of webhooks referenced in the audit log
//    public var webhooks:
}
