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
}
