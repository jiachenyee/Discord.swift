//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

extension Bot {
    func listGuildEmoji(guild guildId: Snowflake) async throws -> [Emoji] {
        try await sendRequest([Emoji].self,
                              endpoint: "/guilds/\(guildId)/emojis")
    }
    
    func getGuildEmoji(guild guildId: Snowflake,
                       emoji emojiId: Snowflake) async throws -> [Emoji] {
        try await sendRequest([Emoji].self,
                              endpoint: "/guilds/\(guildId)/emojis/\(emojiId)")
    }
}
