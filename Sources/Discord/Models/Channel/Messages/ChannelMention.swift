//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ChannelMention: Codable {
    /// id of the channel
    public var id: Snowflake
    
    /// id of the guild containing the channel
    public var guildId: Snowflake
    
    /// the type of channel
    public var type: ChannelType
    
    /// the name of the channel
    public var name: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case guildId = "guild_id"
        case type = "type"
        case name = "name"
    }
    
    init(id: Snowflake, guildId: Snowflake, type: ChannelType, name: String) {
        self.id = id
        self.guildId = guildId
        self.type = type
        self.name = name
    }
}
