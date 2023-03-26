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
        try await sendRequest([StickerPack].self,
                              endpoint: "sticker-packs")
    }
    
    func listGuildStickers(guild guildId: String) async throws -> [Sticker] {
        try await sendRequest([Sticker].self,
                              endpoint: "guilds/\(guildId)/stickers")
    }
    
    func getGuildSticker(guild guildId: String,
                         sticker stickerId: Sticker) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "guilds/\(guildId)/stickers/\(stickerId)")
    }
}
