//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct WelcomeScreenChannel: Codable {
    /// the channel's id
    var channelId: Snowflake
    
    /// the description shown for the channel
    var description: String
    
    /// the emoji id, if the emoji is custom
    var emojiId: Snowflake?
    
    /// the emoji name if custom, the unicode character if standard, or null if no emoji is set
    var emojiName: String?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case description = "description"
        case emojiId = "emoji_id"
        case emojiName = "emoji_name"
    }
}
