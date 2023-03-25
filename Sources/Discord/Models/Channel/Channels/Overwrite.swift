//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Overwrite: Codable {
    /// role or user id
    public var id: Snowflake
    
    /// either 0 (role) or 1 (member)
    public var type: Int
    
    /// permission bit set
    public var allow: Permissions
    
    /// permission bit set
    public var deny: Permissions
    
    public init(id: Snowflake, type: Int, allow: Permissions, deny: Permissions) {
        self.id = id
        self.type = type
        self.allow = allow
        self.deny = deny
    }
}
