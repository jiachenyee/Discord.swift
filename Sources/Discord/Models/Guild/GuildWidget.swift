//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildWidget: Codable {
    /// guild id
    public var id: Snowflake
    
    /// guild name (2-100 characters)
    public var name: String
    
    /// instant invite for the guilds specified widget invite channel
    public var instantInvite: String?
    
    /// voice and stage channels which are accessible by @everyone
    public var channels: [Channel]
    
    /// special widget user objects that includes users presence (Limit 100)
    public var members: [User]
    
    /// number of online members in this guild
    public var presenceCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case instantInvite = "instant_invite"
        case channels = "channels"
        case members = "members"
        case presenceCount = "presence_count"
    }
}
