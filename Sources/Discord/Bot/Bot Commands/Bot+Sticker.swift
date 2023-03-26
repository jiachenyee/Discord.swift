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
}
