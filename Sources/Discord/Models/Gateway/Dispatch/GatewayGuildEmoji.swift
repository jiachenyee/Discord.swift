//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildEmoji: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    
    /// Array of emojis
    public var emojis: [Emoji]
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case emojis = "emojis"
    }
}
