//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getGuildTemplate(code templateCode: String) async throws -> GuildTemplate {
        try await sendRequest(GuildTemplate.self,
                              endpoint: "guilds/templates/\(templateCode)")
    }
    
    func createGuildTemplate(guild guildId: Snowflake,
                             template: CreateGuildTemplate) async throws -> GuildTemplate {
        try await sendRequest(GuildTemplate.self,
                              endpoint: "guilds/\(guildId)/templates",
                              method: .post,
                              data: template)
    }
    
    func syncGuildTemplate(guild guildId: Snowflake,
                           code templateCode: String) async throws -> GuildTemplate {
        try await sendRequest(GuildTemplate.self,
                              endpoint: "guilds/\(guildId)/templates/\(templateCode)",
                              method: .put)
    }
    
    func modifyGuildTemplate(guild guildId: Snowflake,
                             code templateCode: String,
                             modifying modifications: ModifyGuildTemplateRequest) async throws -> GuildTemplate {
        try await sendRequest(GuildTemplate.self,
                              endpoint: "guilds/\(guildId)/templates/\(templateCode)",
                              method: .patch,
                              data: modifications)
    }
    
    func deleteGuildTemplate(guild guildId: Snowflake,
                             code templateCode: String) async throws {
        try await sendRequest(endpoint: "guilds/\(guildId)/templates/\(templateCode)",
                              method: .delete)
    }
}
