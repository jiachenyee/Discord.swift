//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildPreview: Codable {
    /// guild id
    var id: Snowflake
    
    /// guild name (2-100 characters)
    var name: String
    
    /// icon hash
    var icon: String?
    
    /// splash hash
    var splash: String?
    
    /// discovery splash hash
    var discovery_splash: String?
    
    /// custom guild emojis
    var emojis: [Emoji]
    
    /// enabled guild features
    var features:  [GuildFeature]
    
    /// approximate number of members in this guild
    var approximate_member_count: Int
    
    /// approximate number of online members in this guild
    var approximate_presence_count: Int
    
    /// the description for the guild
    var description: String?
    
    /// custom guild stickers
    //    var stickers:  array of sticker objects
#warning("sticker missing")
}
