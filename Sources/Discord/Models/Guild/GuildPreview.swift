//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildPreview: Codable {
    /// guild id
    public var id: Snowflake
    
    /// guild name (2-100 characters)
    public var name: String
    
    /// icon hash
    public var icon: String?
    
    /// splash hash
    public var splash: String?
    
    /// discovery splash hash
    public var discoverySplash: String?
    
    /// custom guild emojis
    public var emojis: [Emoji]
    
    /// enabled guild features
    public var features: [GuildFeature]
    
    /// approximate number of members in this guild
    public var approximateMemberCount: Int
    
    /// approximate number of online members in this guild
    public var approximatePresenceCount: Int
    
    /// the description for the guild
    public var description: String?
    
    /// custom guild stickers
    public var stickers: [Sticker]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case icon = "icon"
        case splash = "splash"
        case discoverySplash = "discovery_splash"
        case emojis = "emojis"
        case features = "features"
        case approximateMemberCount = "approximate_member_count"
        case approximatePresenceCount = "approximate_presence_count"
        case description = "description"
        case stickers = "stickers"
    }
}
