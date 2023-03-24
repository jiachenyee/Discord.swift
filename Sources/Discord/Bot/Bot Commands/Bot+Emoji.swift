//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public extension Bot {
    func listGuildEmojis(guild guildId: Snowflake) async throws -> [Emoji] {
        try await sendRequest([Emoji].self,
                              endpoint: "/guilds/\(guildId)/emojis")
    }
    
    func getGuildEmoji(guild guildId: Snowflake,
                       emoji emojiId: Snowflake) async throws -> Emoji {
        try await sendRequest(Emoji.self,
                              endpoint: "/guilds/\(guildId)/emojis/\(emojiId)")
    }
    
    #warning("Incomplete implementation")
//    func createGuildEmoji(guild guildId: Snowflake) async throws -> Emoji {
//        try await sendRequest(Emoji.self,
//                              endpoint: "/guilds/\(guildId)/emojis/\(emojiId)")
//    }
    
    func modifyGuildEmoji(guild guildId: Snowflake,
                          emoji emojiId: Snowflake,
                          modifications: ModifyEmojiRequest) async throws -> Emoji {
        try await sendRequest(Emoji.self,
                              endpoint: "/guilds/\(guildId)/emojis/\(emojiId)",
                              method: .patch,
                              data: modifications)
    }
    
    func deleteGuildEmoji(guild guildId: Snowflake,
                          emoji emojiId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/emojis/\(emojiId)",
                              method: .delete)
    }
}
