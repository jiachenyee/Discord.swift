//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    /// Get information on a sticker
    /// - Parameter stickerId: Sticker ID of target sticker
    /// - Returns: Returns a sticker object for the given sticker ID.
    /// > Discord Reference: https://discord.com/developers/docs/resources/sticker#get-sticker
    func getSticker(_ stickerId: Snowflake) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "stickers/\(stickerId)")
    }
    
    /// Get a list of sticker packs available to Nitro subscribers
    /// - Returns: Returns the list of sticker packs available to Nitro subscribers.
    /// > Discord Reference: https://discord.com/developers/docs/resources/sticker#list-nitro-sticker-packs
    func listNitroStickerPacks() async throws -> [StickerPack] {
        try await sendRequest(StickerPacks.self,
                              endpoint: "sticker-packs").stickerPacks
    }
    
    /// List out all the stickers in a guild
    /// - Parameter guildId: Target guild ID
    /// - Returns: Returns an array of sticker objects for the given guild. Includes user fields if the bot has the `MANAGE_EMOJIS_AND_STICKERS` permission.
    /// > Discord Reference: https://discord.com/developers/docs/resources/sticker#list-guild-stickers
    func listGuildStickers(guild guildId: Snowflake) async throws -> [Sticker] {
        try await sendRequest([Sticker].self,
                              endpoint: "guilds/\(guildId)/stickers")
    }
    
    /// Get information on a sticker using it's guild
    /// - Parameters:
    ///   - guildId: Target guild ID
    ///   - stickerId: Target sticker ID
    /// - Returns: Returns a sticker object for the given guild and sticker IDs. Includes the user field if the bot has the `MANAGE_EMOJIS_AND_STICKERS` permission.
    /// > Discord Reference: https://discord.com/developers/docs/resources/sticker#get-guild-sticker
    func getGuildSticker(guild guildId: Snowflake,
                         sticker stickerId: Snowflake) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "guilds/\(guildId)/stickers/\(stickerId)")
    }
    
    /// Create a new sticker for the guild
    /// - Important: Requires the `MANAGE_EMOJIS_AND_STICKERS` permission.
    /// - Parameters:
    ///   - guildId: Target guild ID
    ///   - sticker: New sticker information
    /// - Returns: Returns the new sticker object on success. Fires a Guild Stickers Update Gateway event.
    /// > Discord Reference: https://discord.com/developers/docs/resources/sticker#create-guild-sticker
    @discardableResult
    func createGuildSticker(guild guildId: Snowflake,
                            sticker: CreateGuildSticker,
                            reason: String? = nil) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "guilds/\(guildId)/stickers",
                              method: .post,
                              data: sticker,
                              reason: reason)
    }
    
    /// Modify the given sticker.
    ///
    /// - Important: Requires the `MANAGE_EMOJIS_AND_STICKERS` permission.
    /// - Parameters:
    ///   - guildId: Target guild ID
    ///   - stickerId: Target sticker ID
    ///   - modifications: Intended modifications
    /// - Returns: Returns the updated sticker object on success. Fires a Guild Stickers Update Gateway event.
    /// > Discord Reference: https://discord.com/developers/docs/resources/sticker#modify-guild-sticker
    @discardableResult
    func modifyGuildSticker(guild guildId: Snowflake,
                            sticker stickerId: Snowflake,
                            modifications: ModifyGuildStickerRequest,
                            reason: String? = nil) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "guilds/\(guildId)/stickers/\(stickerId)",
                              method: .patch,
                              data: modifications, reason: reason)
    }
    
    /// Delete the given sticker.
    /// - Important: Requires the `MANAGE_EMOJIS_AND_STICKERS` permission.
    /// - Parameters:
    ///   - guildId: Target guild ID
    ///   - stickerId: Target sticker ID
    /// > Discord Reference: https://discord.com/developers/docs/resources/sticker#delete-guild-sticker
    func deleteGuildSticker(guild guildId: Snowflake,
                            sticker stickerId: Snowflake,
                            reason: String? = nil) async throws {
        try await sendRequest(endpoint: "guilds/\(guildId)/stickers/\(stickerId)",
                              method: .delete,
                              reason: reason)
    }
}
