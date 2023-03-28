//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func listScheduledEvents(forGuild guildId: Snowflake,
                             withUserCount: Bool = true) async throws -> [ScheduledEvent] {
        try await sendRequest([ScheduledEvent].self,
                              endpoint: "guilds/\(guildId)/scheduled-events",
                              parameters: ["with_user_count": withUserCount])
    }
    
    @discardableResult
    func createScheduledEvent(guild guildId: Snowflake,
                              scheduledEvent: CreateGuildScheduledEvent,
                              reason: String? = nil) async throws -> ScheduledEvent {
        try await sendRequest(ScheduledEvent.self,
                              endpoint: "guilds/\(guildId)/scheduled-events",
                              method: .post,
                              data: scheduledEvent,
                              reason: reason)
    }
    
    func getScheduledEvent(forGuild guildId: Snowflake,
                           event eventId: Snowflake,
                           withUserCount: Bool = true) async throws -> ScheduledEvent {
        try await sendRequest(ScheduledEvent.self,
                              endpoint: "guilds/\(guildId)/scheduled-events/\(eventId)",
                              parameters: ["with_user_count": withUserCount])
    }
    
    @discardableResult
    func modifyScheduledEvent(guild guildId: Snowflake,
                              event eventId: Snowflake,
                              modifying modifications: ModifyGuildScheduledRequest,
                              reason: String? = nil) async throws -> ScheduledEvent {
        try await sendRequest(ScheduledEvent.self,
                              endpoint: "guilds/\(guildId)/scheduled-events/\(eventId)",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    func deleteScheduledEvent(guild guildId: Snowflake,
                              event eventId: Snowflake) async throws {
        try await sendRequest(endpoint: "guilds/\(guildId)/scheduled-events/\(eventId)",
                              method: .delete)
    }
    
    func getScheduledEventUsers(forGuild guildId: Snowflake,
                                event eventId: Snowflake,
                                filtering filters: ScheduledEventUsersFilter = .using())
    async throws -> [ScheduledEventUser] {
        try await sendRequest([ScheduledEventUser].self,
                              endpoint: "guilds/\(guildId)/scheduled-events/\(eventId)/users",
                              parameters: filters.toParameters())
    }
}
