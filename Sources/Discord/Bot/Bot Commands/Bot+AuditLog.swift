//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension Bot {
    
    /// Retrieve the audit log from a guild/server
    ///
    /// The returned list of audit log entries is ordered based on whether you use before or after. When using before, the list is ordered by the audit log entry ID descending (newer entries first). If after is used, the list is reversed and appears in ascending order (older entries first). Omitting both before and after defaults to before the current timestamp and will show the most recent entries in descending order by ID, the opposite can be achieved using after=0 (showing oldest entries).
    ///
    /// > Discord Reference: [https://discord.com/developers/docs/resources/audit-log#get-guild-audit-log](https://discord.com/developers/docs/resources/audit-log#get-guild-audit-log)
    /// 
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - filters: The filters applied on the returned audit log object. 
    /// - Returns: Returns an audit log object for the guild.
    func getGuildAuditLog(forGuild guildId: Snowflake,
                          filters: AuditLogFilters = .using()) async throws -> AuditLog {
        try await sendRequest(AuditLog.self,
                              endpoint: "/guilds/\(guildId)/audit-logs",
                              parameters: filters.toParameters())
    }
}
