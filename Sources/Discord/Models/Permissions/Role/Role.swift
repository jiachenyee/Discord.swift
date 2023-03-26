//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct Role: Codable {
    /// role id
    public var id: Snowflake
    
    /// role name
    public var name: String
    
    /// integer representation of hexadecimal color code
    public var color: Int
    
    /// if this role is pinned in the user listing
    public var hoist: Bool
    
    /// role icon hash
    public var icon: String?
    
    /// role unicode emoji
    public var unicodeEmoji: String?
    
    /// position of this role
    public var position: Int
    
    /// permission bit set
    public var permissions: Permissions
    
    /// whether this role is managed by an integration
    public var managed: Bool
    
    /// whether this role is mentionable
    public var mentionable: Bool
     
    /// the tags this role has
    public var tags: RoleTag?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case color = "color"
        case hoist = "hoist"
        case icon = "icon"
        case unicodeEmoji = "unicode_emoji"
        case position = "position"
        case permissions = "permissions"
        case managed = "managed"
        case mentionable = "mentionable"
        case tags = "tags"
    }
}
