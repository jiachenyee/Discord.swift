//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct ThreadMembersUpdate: GatewayEventData {
    /// ID of the thread
    public var id: Snowflake
    
    /// ID of the guild
    public var guildId: Snowflake
    
    /// Approximate number of members in the thread, capped at 50
    public var memberCount: Int
    
    /// Users who were added to the thread
    public var addedMembers: [ThreadMember]?
    
    /// ID of the users who were removed from the thread
    public var removedMemberIds: [Snowflake]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case guildId = "guild_id"
        case memberCount = "member_count"
        case addedMembers = "added_members"
        case removedMemberIds = "removed_member_ids"
    }
}
