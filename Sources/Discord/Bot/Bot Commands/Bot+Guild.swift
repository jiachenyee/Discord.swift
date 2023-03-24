//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public extension Bot {
    func createGuild(info guildInformation: CreateGuildRequest) async throws -> Guild {
        try await sendRequest(Guild.self,
                              endpoint: "/guilds",
                              method: .post,
                              data: guildInformation)
    }
    
    func getGuild(_ guildId: Snowflake, withCounts: Bool = false) async throws -> Guild {
        try await sendRequest(Guild.self,
                              endpoint: "/guilds/\(guildId)",
                              parameters: [
                                "with_counts": withCounts
                              ])
    }
    
    func getGuildPreview(_ guildId: Snowflake) async throws -> GuildPreview {
        try await sendRequest(GuildPreview.self,
                              endpoint: "/guilds/\(guildId)/preview")
    }
    
    func modifyGuild(_ guildId: Snowflake,
                     modify modifyRequest: ModifyGuildRequest) async throws -> Guild {
        try await sendRequest(Guild.self,
                              endpoint: "/guilds/\(guildId)",
                              method: .patch,
                              data: modifyRequest)
    }
    
    func deleteGuild(_ guildId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)",
                              method: .delete)
    }
    
    func getGuildChannels(guild guildId: Snowflake) async throws -> [Channel] {
        try await sendRequest([Channel].self,
                              endpoint: "/guilds/\(guildId)/channels")
    }
    
    func createGuildChannel(guild guildId: Snowflake,
                            channel: NewGuildChannel) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/guilds/\(guildId)/channels",
                              method: .post,
                              data: channel)
    }
    
    func modifyGuildChannelPositions(guild guildId: Snowflake,
                                     move positionRequest: GuildChannelPositionsRequest) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/channels",
                              method: .patch,
                              data: positionRequest)
    }
    
    func listActiveGuildThreads(guild guildId: Snowflake) async throws -> ActiveGuildThreads {
        try await sendRequest(ActiveGuildThreads.self,
                              endpoint: "/guilds/\(guildId)/threads/active")
    }

    func getGuildMember(guild guildId: Snowflake,
                        member userId: Snowflake) async throws -> GuildMember {
        try await sendRequest(GuildMember.self,
                              endpoint: "/guilds/\(guildId)/members/\(userId)")
    }
    
    func listGuildMembers(guild guildId: Snowflake,
                          filtered filters: GuildMemberFilter = .using()) async throws -> [GuildMember] {
        try await sendRequest([GuildMember].self,
                              endpoint: "/guilds/\(guildId)/members",
                              parameters: filters.toParameters())
    }
    
    func searchGuildMembers(guild guildId: Snowflake,
                            using query: GuildMemberQuery) async throws -> [GuildMember] {
        try await sendRequest([GuildMember].self,
                              endpoint: "/guilds/\(guildId)/members/search",
                              parameters: query.toParameters())
    }
    
    func modifyGuildMember(guild guildId: Snowflake,
                           user userId: Snowflake,
                           modifications: ModifyGuildMemberRequest) async throws -> GuildMember {
        try await sendRequest(GuildMember.self,
                              endpoint: "/guilds/\(guildId)/members/\(userId)",
                              method: .patch,
                              data: modifications)
    }
    
    func modifyCurrentMember(guild guildId: Snowflake,
                             modifications: ModifyCurrentMemberRequest) async throws -> GuildMember {
        try await sendRequest(GuildMember.self,
                              endpoint: "/guilds/\(guildId)/members/@me",
                              method: .patch,
                              data: modifications)
    }
    
    func addGuildMemberRole(guild guildId: Snowflake,
                            user userId: Snowflake,
                            role roleId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/members/\(userId)/roles/\(roleId)",
                              method: .put)
    }
    
    func removeGuildMemberRole(guild guildId: Snowflake,
                               user userId: Snowflake,
                               role roleId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/members/\(userId)/roles/\(roleId)",
                              method: .delete)
    }
    
    func removeGuildMember(guild guildId: Snowflake,
                           user userId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/members/\(userId)",
                              method: .delete)
    }
}
