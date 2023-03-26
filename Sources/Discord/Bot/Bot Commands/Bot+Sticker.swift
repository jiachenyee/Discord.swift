//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getSticker(_ stickerId: Snowflake) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "stickers/\(stickerId)")
    }
    
    func listNitroStickerPacks() async throws -> [StickerPack] {
        try await sendRequest(StickerPacks.self,
                              endpoint: "sticker-packs").stickerPacks
    }
    
    func listGuildStickers(guild guildId: Snowflake) async throws -> [Sticker] {
        try await sendRequest([Sticker].self,
                              endpoint: "guilds/\(guildId)/stickers")
    }
    
    func getGuildSticker(guild guildId: Snowflake,
                         sticker stickerId: Snowflake) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "guilds/\(guildId)/stickers/\(stickerId)")
    }
    
    @discardableResult
    func createGuildSticker(guild guildId: Snowflake,
                            sticker: CreateGuildSticker) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "guilds/\(guildId)/stickers",
                              method: .post,
                              data: sticker)
    }
    
    @discardableResult
    func modifyGuildSticker(guild guildId: Snowflake,
                            sticker stickerId: Snowflake,
                            modifications: ModifyGuildStickerRequest) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "guilds/\(guildId)/stickers/\(stickerId)",
                              method: .patch,
                              data: modifications)
    }
    
    func deleteGuildSticker(guild guildId: Snowflake,
                            sticker stickerId: Snowflake) async throws {
        try await sendRequest(endpoint: "guilds/\(guildId)/stickers/\(stickerId)",
                              method: .delete)
    }
}
