//
//  File.swift
//
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct Sticker: Codable {
    /// id of the sticker
    public var id: Snowflake
    
    /// for standard stickers, id of the pack the sticker is from
    public var packId: Snowflake?
    
    /// name of the sticker
    public var name: String
    
    /// description of the sticker
    public var description: String?
    
    /// autocomplete/suggestion tags for the sticker (max 200 characters)
    public var tags: String
    
    /// type of sticker
    public var type: StickerType
    
    /// type of sticker format
    public var formatType: StickerFormat
    
    /// whether this guild sticker can be used, may be false due to loss of Server Boosts
    public var available: Bool?
    
    /// id of the guild that owns this sticker
    public var guildId: Snowflake?
    
    /// the user that uploaded the guild sticker
    public var user: User?
    
    /// the standard sticker's sort order within its pack
    public var sortValue: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case packId = "pack_id"
        case name = "name"
        case description = "description"
        case tags = "tags"
        case type = "type"
        case formatType = "format_type"
        case available = "available"
        case guildId = "guild_id"
        case user = "user"
        case sortValue = "sort_value"
    }
    
    public init(id: Snowflake,
                packId: Snowflake? = nil,
                name: String,
                description: String? = nil,
                tags: String,
                type: StickerType,
                formatType: StickerFormat,
                available: Bool? = nil,
                guildId: Snowflake? = nil,
                user: User? = nil,
                sortValue: Int? = nil) {
        self.id = id
        self.packId = packId
        self.name = name
        self.description = description
        self.tags = tags
        self.type = type
        self.formatType = formatType
        self.available = available
        self.guildId = guildId
        self.user = user
        self.sortValue = sortValue
    }
}
