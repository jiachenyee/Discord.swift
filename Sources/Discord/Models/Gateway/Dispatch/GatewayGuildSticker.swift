//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildSticker: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    
    /// Array of stickers
    public var stickers: [Sticker]
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case stickers = "stickers"
    }
}
