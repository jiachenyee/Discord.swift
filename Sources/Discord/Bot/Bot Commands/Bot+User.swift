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
    
    func createDM(_ directMessage: CreateDirectMessage) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "users/@me/channels",
                              method: .post,
                              data: directMessage)
    }
    
    func createGroupDM(_ groupDirectMessage: CreateGroupDM) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "users/@me/channels",
                              method: .post,
                              data: groupDirectMessage)
    }
    
    func getUserConnections() async throws -> [Connection] {
        try await sendRequest([Connection].self,
                              endpoint: "users/@me/connections")
    }
    
    func getUserApplicationRoleConnection(_ appId: Snowflake) async throws -> ApplicationRoleConnection {
        try await sendRequest(ApplicationRoleConnection.self,
                              endpoint: "users/@me/applications/\(appId)/role-connection")
    }
    
    func updateUserApplicationRoleConnection(_ appId: Snowflake,
                                             updating updates: UserApplicationRoleConnectionRequest) async throws -> ApplicationRoleConnection {
        try await sendRequest(ApplicationRoleConnection.self,
                              endpoint: "users/@me/applications/\(appId)/role-connection",
                              method: .patch,
                              data: updates)
    }
}
