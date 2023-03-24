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
    
    func modifyGuild(_ guildId: Snowflake,
                     modify modifyRequest: ModifyGuildRequest) async throws -> Guild {
        try await sendRequest(Guild.self,
                              endpoint: "/guilds/\(guildId)",
                              method: .post,
                              data: modifyRequest)
    }
    
    func deleteGuild(_ guildId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)",
                              method: .delete)
    }
}
