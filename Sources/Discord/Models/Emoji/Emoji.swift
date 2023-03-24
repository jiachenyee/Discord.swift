//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct Emoji: Codable {
    /// emoji id
    public var id: Snowflake?
    
    /// emoji name
    public var name: String?
    
    #warning("roles missing")
//    public var roles: array of role object ids    roles allowed to use this emoji
    
    /// user that created this emoji
    public var user: User?
    
    /// whether this emoji must be wrapped in colons
    public var require_colons: Bool?
    
    /// whether this emoji is managed
    public var managed: Bool?
    
    /// whether this emoji is animated
    public var animated: Bool?
    
    /// whether this emoji can be used, may be false due to loss of Server Boosts
    public var available: Bool?
    
    public static func emoji(_ emoji: String) -> Self {
        Self(name: emoji)
    }
}
