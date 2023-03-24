//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ModifyEmojiRequest: Codable {
    /// name of the emoji
    public var name: String?
    
    /// roles allowed to use this emoji
    public var roles: [Snowflake]?
    
    public init(name: String? = nil,
                roles: [Snowflake]? = nil) {
        self.name = name
        self.roles = roles
    }
    
    public static func modifying(name: String? = nil,
                                 roles: [Snowflake]? = nil) -> Self {
        Self(name: name,
             roles: roles)
    }
}
