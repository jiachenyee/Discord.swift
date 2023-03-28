//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public extension Bot {
    /// Get a list of guild emojis.
    /// - Parameter guildId: The guild ID of the target guild.
    /// - Returns: Returns a list of emoji objects for the given guild.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/emoji#list-guild-emojis](https://discord.com/developers/docs/resources/emoji#list-guild-emojis)
    func listGuildEmojis(guild guildId: Snowflake) async throws -> [Emoji] {
        try await sendRequest([Emoji].self,
                              endpoint: "/guilds/\(guildId)/emojis")
    }
    
    /// Get a specific guild emoji.
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - emojiId: The emoji ID of the target emoji.
    /// - Returns: Returns an emoji object for the given guild and emoji IDs.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/emoji#get-guild-emoji](https://discord.com/developers/docs/resources/emoji#get-guild-emoji)
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
    
    /// Modify the given emoji.
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - emojiId: The emoji ID of the target emoji.
    ///   - modifications: The exact modifications to the emojis, such as the updated name of the emoji and the roles allowed to use the emoji.
    /// - Returns: Returns the updated emoji object on success. Fires a Guild Emojis Update Gateway event.
    /// - Important: Requires the `MANAGE_EMOJIS_AND_STICKERS` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/emoji#modify-guild-emoji](https://discord.com/developers/docs/resources/emoji#modify-guild-emoji)
    @discardableResult
    func modifyGuildEmoji(guild guildId: Snowflake,
                          emoji emojiId: Snowflake,
                          modifications: ModifyEmojiRequest,
                          reason: String? = nil) async throws -> Emoji {
        try await sendRequest(Emoji.self,
                              endpoint: "/guilds/\(guildId)/emojis/\(emojiId)",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    /// Delete a specific guild emoji.
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - emojiId: The emoji ID of the target emoji. 
    /// > Discord Reference: [https://discord.com/developers/docs/resources/emoji#delete-guild-emoji](https://discord.com/developers/docs/resources/emoji#delete-guild-emoji)
    func deleteGuildEmoji(guild guildId: Snowflake,
                          emoji emojiId: Snowflake,
                          reason: String? = nil) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/emojis/\(emojiId)",
                              method: .delete,
                              reason: reason)
    }
}
