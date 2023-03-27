//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct ForumTag: Codable {
    /// the id of the tag
    public var id: Snowflake?
    
    /// the name of the tag (0-20 characters)
    public var name: String
    
    /// whether this tag can only be added to or removed from threads by a member with the MANAGE_THREADS permission
    public var moderated: Bool
    
    /// the id of a guild's custom emoji *
    public var emojiId: Snowflake?
    
    /// the unicode character of the emoji *
    public var emojiName: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case moderated = "moderated"
        case emojiId = "emoji_id"
        case emojiName = "emoji_name"
    }
    
    public init(id: Snowflake? = nil,
                name: String,
                moderated: Bool,
                emojiId: Snowflake? = nil,
                emojiName: String? = nil) {
        self.id = id
        self.name = name
        self.moderated = moderated
        self.emojiId = emojiId
        self.emojiName = emojiName
    }
}
