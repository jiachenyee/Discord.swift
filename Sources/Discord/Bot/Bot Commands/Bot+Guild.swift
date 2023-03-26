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
    func createGuild(info guildInformation: CreateGuildRequest) async throws -> Guild {
        try await sendRequest(Guild.self,
                              endpoint: "/guilds",
                              method: .post,
                              data: guildInformation)
    }
}
