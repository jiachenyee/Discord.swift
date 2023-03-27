//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildMemberChunk: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    
    /// Set of guild members
    public var members: [GuildMember]
    
    /// Chunk index in the expected chunks for this response `(0 <= chunk_index < chunk_count)`
    public var chunkIndex: Int
    
    /// Total number of expected chunks for this response
    public var chunkCount: Int
    
    /// When passing true to REQUEST_GUILD_MEMBERS, presences of the returned members will be here
    public var presences: [Presence]?
    
    /// Nonce used in the Guild Members Request
    public var nonce: String?
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case members = "members"
        case chunkIndex = "chunk_index"
        case chunkCount = "chunk_count"
        case presences = "presences"
        case nonce = "nonce"
    }
}
