//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyGuildRolePositionRequest: Codable {
    /// Role
    public var id: Snowflake
    
    /// sorting position of the role
    public var position: Int?
    
    public init(id: Snowflake, position: Int? = nil) {
        self.id = id
        self.position = position
    }
    
    public static func changingPosition(of role: Snowflake, to position: Int? = nil) -> Self {
        Self(id: role, position: position)
    }
}
