//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct DefaultReaction: Codable {
    /// the id of a guild's custom emoji
    var emojiId: Snowflake?
    
    /// the unicode character of the emoji
    var emojiName: String
    
    enum CodingKeys: String, CodingKey {
        case emojiId = "emoji_id"
        case emojiName = "emoji_name"
    }
}
