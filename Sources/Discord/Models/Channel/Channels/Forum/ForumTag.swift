//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct ForumTag: Codable {
    /// the id of the tag
    var id: Snowflake?
    
    /// the name of the tag (0-20 characters)
    var name: String
    
    /// whether this tag can only be added to or removed from threads by a member with the MANAGE_THREADS permission
    var moderated: Bool
    
    /// the id of a guild's custom emoji *
    var emojiId: Snowflake?
    
    /// the unicode character of the emoji *
    var emojiName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case moderated = "moderated"
        case emojiId = "emoji_id"
        case emojiName = "emoji_name"
    }
}
