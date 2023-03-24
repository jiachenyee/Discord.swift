//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildChannelPositionsRequest: Codable {
    /// channel id
    public var id: Snowflake
    
    /// sorting position of the channel
    public var position: Int?
    
    /// syncs the permission overwrites with the new parent, if moving to a new category
    public var lockPermissions: Bool?
    
    /// the new parent ID for the channel that is moved
    public var parentId: Snowflake?
    
    init(id: Snowflake,
         position: Int? = nil,
         lockPermissions: Bool? = nil,
         parentId: Snowflake? = nil) {
        self.id = id
        self.position = position
        self.lockPermissions = lockPermissions
        self.parentId = parentId
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case position = "position"
        case lockPermissions = "lock_permissions"
        case parentId = "parent_id"
    }
    
    public static func intoCategory(channel id: Snowflake,
                                    position: Int? = nil,
                                    syncPermissions lockPermissions: Bool,
                                    parentId: Snowflake) -> Self {
        Self(id: id,
             position: position,
             lockPermissions: lockPermissions,
             parentId: parentId)
    }
    
    public static func outsideCategory(channel id: Snowflake,
                                       position: Int? = nil) -> Self {
        Self(id: id,
             position: position)
    }
}
