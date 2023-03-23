//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension Bot {
    func getGuildAuditLog(forGuild guildId: Snowflake,
                          filters: AuditLogFilters) async throws -> Data {
        try await sendRequest(endpoint: "/guilds/\(guildId)/audit-logs",
                              parameters: filters.toParameters())
    }
}
