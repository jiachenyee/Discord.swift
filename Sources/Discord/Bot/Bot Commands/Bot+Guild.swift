//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public extension Bot {
    /// Create a new guild.
    /// - Parameter guildInformation: The specifications of the guild returned.
    /// - Returns: Returns a guild object on success. Fires a Guild Create Gateway event.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/guild#create-guild](https://discord.com/developers/docs/resources/guild#create-guild)
    @discardableResult
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
    
    @discardableResult
    func modifyGuild(_ guildId: Snowflake,
                     modify modifyRequest: ModifyGuildRequest,
                     reason: String? = nil) async throws -> Guild {
        try await sendRequest(Guild.self,
                              endpoint: "/guilds/\(guildId)",
                              method: .patch,
                              data: modifyRequest,
                              reason: reason)
    }
    
    func deleteGuild(_ guildId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)",
                              method: .delete)
    }
    
    func getGuildChannels(guild guildId: Snowflake) async throws -> [Channel] {
        try await sendRequest([Channel].self,
                              endpoint: "/guilds/\(guildId)/channels")
    }
    
    @discardableResult
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
    
    @discardableResult
    func modifyGuildMember(guild guildId: Snowflake,
                           user userId: Snowflake,
                           modifications: ModifyGuildMemberRequest,
                           reason: String? = nil) async throws -> GuildMember {
        try await sendRequest(GuildMember.self,
                              endpoint: "/guilds/\(guildId)/members/\(userId)",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    @discardableResult
    func modifyCurrentMember(guild guildId: Snowflake,
                             modifications: ModifyCurrentMemberRequest,
                             reason: String? = nil) async throws -> GuildMember {
        try await sendRequest(GuildMember.self,
                              endpoint: "/guilds/\(guildId)/members/@me",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    func addGuildMemberRole(guild guildId: Snowflake,
                            user userId: Snowflake,
                            role roleId: Snowflake,
                            reason: String? = nil) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/members/\(userId)/roles/\(roleId)",
                              method: .put,
                              reason: reason)
    }
    
    func removeGuildMemberRole(guild guildId: Snowflake,
                               user userId: Snowflake,
                               role roleId: Snowflake,
                               reason: String? = nil) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/members/\(userId)/roles/\(roleId)",
                              method: .delete,
                              reason: reason)
    }
    
    func removeGuildMember(guild guildId: Snowflake,
                           user userId: Snowflake,
                           reason: String? = nil) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/members/\(userId)",
                              method: .delete,
                              reason: reason)
    }
    
    func getGuildBans(guild guildId: Snowflake,
                      filtering filter: GuildBanFilter = .using()) async throws -> [Ban] {
        try await sendRequest([Ban].self,
                              endpoint: "/guilds/\(guildId)/bans",
                              parameters: filter.toParameters())
    }
    
    func getGuildBan(guild guildId: Snowflake,
                     user userId: Snowflake) async throws -> Ban {
        try await sendRequest(Ban.self,
                              endpoint: "/guilds/\(guildId)/bans/\(userId)")
    }
    
    func createGuildBan(guild guildId: Snowflake,
                        user userId: Snowflake,
                        preferences: GuildBanPreferences = .init(),
                        reason: String? = nil) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/bans/\(userId)",
                              method: .put,
                              data: preferences,
                              reason: reason)
    }
    
    func removeGuildBan(guild guildId: Snowflake,
                        user userId: Snowflake,
                        reason: String? = nil) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/bans/\(userId)",
                              method: .delete,
                              reason: reason)
    }
    
    func getGuildRoles(guild guildId: Snowflake) async throws -> [Role] {
        try await sendRequest([Role].self,
                              endpoint: "/guilds/\(guildId)/roles")
    }
    
    @discardableResult
    func createGuildRole(guild guildId: Snowflake,
                         role: NewRole,
                         reason: String? = nil) async throws -> Role {
        try await sendRequest(Role.self,
                              endpoint: "/guilds/\(guildId)/roles", method: .post,
                              data: role, reason: reason)
    }
    
    @discardableResult
    func modifyGuildRolePositions(guild guildId: Snowflake,
                                  requests: [ModifyGuildRolePositionRequest],
                                  reason: String? = nil) async throws -> [Role] {
        try await sendRequest([Role].self,
                              endpoint: "/guilds/\(guildId)/roles", method: .patch,
                              data: requests, reason: reason)
    }
    
    @discardableResult
    func modifyGuildRole(guild guildId: Snowflake,
                         role roleId: Snowflake,
                         withModifications modifications: ModifyGuildRoleRequest,
                         reason: String? = nil) async throws -> Role {
        try await sendRequest(Role.self,
                              endpoint: "/guilds/\(guildId)/roles/\(roleId)", method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    @discardableResult
    func modifyGuildMFALevel(guild guildId: Snowflake,
                             withModifications modifications: ModifyGuildMFARequest,
                             reason: String? = nil) async throws -> MFALevel {
        try await sendRequest(MFALevel.self,
                              endpoint: "/guilds/\(guildId)/mfa", method: .post,
                              data: modifications,
                              reason: reason)
    }
    
    func deleteGuildRole(guild guildId: Snowflake,
                         role roleId: Snowflake,
                         reason: String? = nil) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/roles/\(roleId)",
                              method: .delete, reason: reason)
    }
    
    func getGuildPruneCount(guild guildId: Snowflake,
                            filtering filters: PruneFilter) async throws -> Prune {
        try await sendRequest(Prune.self,
                              endpoint: "/guilds/\(guildId)/prune",
                              parameters: filters.toParameters())
    }
    
    @discardableResult
    func beginGuildPrune(guild guildId: Snowflake,
                         request: PruneRequest,
                         reason: String? = nil) async throws -> Prune {
        try await sendRequest(Prune.self,
                              endpoint: "/guilds/\(guildId)/prune",
                              method: .post,
                              data: request,
                              reason: reason)
    }
    
    func getGuildVoiceRegions(guild guildId: Snowflake) async throws -> [VoiceRegion] {
        try await sendRequest([VoiceRegion].self,
                              endpoint: "/guilds/\(guildId)/regions")
    }
    
    func getGuildInvites(guild guildId: Snowflake) async throws -> [Invite] {
        try await sendRequest([Invite].self,
                              endpoint: "guilds/\(guildId)/invites")
    }
    
    func getGuildIntegrations(guild guildId: Snowflake) async throws -> [Integration] {
        try await sendRequest([Integration].self,
                              endpoint: "guilds/\(guildId)/integrations")
    }
    
    func deleteGuildIntegrations(guild guildId: Snowflake,
                                 integration integrationId: Snowflake,
                                 reason: String? = nil) async throws {
        try await sendRequest(endpoint: "guilds/\(guildId)/integrations/\(integrationId)",
                              method: .delete,
                              reason: reason)
    }
    
    func getGuildWidgetSettings(guild guildId: Snowflake) async throws -> GuildWidgetSettings {
        try await sendRequest(GuildWidgetSettings.self,
                              endpoint: "guilds/\(guildId)/widget")
    }
    
    @discardableResult
    func modifyGuildWidget(guild guildId: Snowflake,
                           widgetSettings: GuildWidgetSettings,
                           reason: String? = nil) async throws -> GuildWidgetSettings {
        try await sendRequest(GuildWidgetSettings.self,
                              endpoint: "guilds/\(guildId)/widget",
                              method: .patch,
                              data: widgetSettings, reason: reason)
    }
    
    func getGuildWidget(guild guildId: Snowflake) async throws -> GuildWidget {
        try await sendRequest(GuildWidget.self,
                              endpoint: "guilds/\(guildId)/widget.json")
    }
    
    func getGuildVanityURL(guild guildId: Snowflake) async throws -> Invite {
        try await sendRequest(Invite.self,
                              endpoint: "guilds/\(guildId)/vanity-url")
    }
    
    func getGuildWidgetImage(guild guildId: Snowflake,
                             style: WidgetStyle = .shield) async throws -> Data {
        try await sendRequest(endpoint: "guilds/\(guildId)/widget.png",
                              parameters: ["style": style.rawValue])
    }
    
    func getGuildWelcomeScreen(guild guildId: Snowflake) async throws -> WelcomeScreen {
        try await sendRequest(WelcomeScreen.self,
                              endpoint: "guilds/\(guildId)/welcome-screen")
    }
    
    @discardableResult
    func modifyGuildWelcomeScreen(guild guildId: Snowflake,
                                  modifications: ModifyWelcomeScreen,
                                  reason: String? = nil) async throws -> WelcomeScreen {
        try await sendRequest(WelcomeScreen.self,
                              endpoint: "guilds/\(guildId)/welcome-screen",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    func modifyCurrentUserVoiceState(guild guildId: Snowflake,
                                     modifications: ModifyCurrentUserVoiceState) async throws {
        try await sendRequest(endpoint: "guilds/\(guildId)/voice-states/@me",
                              method: .patch,
                              data: modifications)
    }
    
    func modifyUserVoiceState(guild guildId: Snowflake,
                              user userId: Snowflake,
                              modifications: ModifyUserVoiceState,
                              reason: String? = nil) async throws {
        try await sendRequest(endpoint: "guilds/\(guildId)/voice-states/\(userId)",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
}
