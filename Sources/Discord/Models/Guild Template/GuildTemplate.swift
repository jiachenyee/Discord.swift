//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct GuildTemplate: Codable {
    /// the template code (unique ID)
    public var code: String
    
    /// template name
    public var name: String
    
    /// the description for the template
    public var description: String?
    
    /// number of times this template has been used
    public var usageCount: Int
    
    /// the ID of the user who created the template
    public var creatorId: Snowflake
    
    /// the user who created the template
    public var creator: User
    
    /// when this template was created
    public var createdAt: ISO8601Timestamp
    
    /// when this template was last synced to the source guild
    public var updatedAt: ISO8601Timestamp
    
    /// the ID of the guild this template is based on
    public var sourceGuildId: Snowflake
    
    /// the guild snapshot this template contains
    public var serializedSourceGuild: Guild
    
    /// whether the template has unsynced changes
    public var isDirty: Bool?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
        case description = "description"
        case usageCount = "usage_count"
        case creatorId = "creator_id"
        case creator = "creator"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case sourceGuildId = "source_guild_id"
        case serializedSourceGuild = "serialized_source_guild"
        case isDirty = "is_dirty"
    }
}
