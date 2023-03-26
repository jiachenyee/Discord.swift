//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getCurrentUser() async throws -> User {
        try await sendRequest(User.self,
                              endpoint: "users/@me")
    }
    
    func getUser(_ userId: Snowflake) async throws -> User {
        try await sendRequest(User.self,
                              endpoint: "users/\(userId)")
    }
    
    @discardableResult
    func modifyCurrentUser(_ modifications: ModifyCurrentUser) async throws -> User {
        try await sendRequest(User.self,
                              endpoint: "users/@me",
                              method: .patch,
                              data: modifications)
    }
    
    func getCurrentUserGuilds(filtering filters: FilterCurrentUserGuild) async throws -> [PartialGuild] {
        try await sendRequest([PartialGuild].self,
                              endpoint: "users/@me/guilds",
                              parameters: filters.toParameters())
    }
    
    func getCurrentUserGuildMember(_ guildId: Snowflake) async throws -> GuildMember {
        try await sendRequest(GuildMember.self,
                              endpoint: "users/@me/guilds/\(guildId)")
    }
    
    func leaveGuild(_ guildId: Snowflake) async throws {
        try await sendRequest(endpoint: "users/@me/guilds/\(guildId)",
                              method: .delete)
    }
}
