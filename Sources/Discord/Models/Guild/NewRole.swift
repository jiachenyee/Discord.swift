//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct NewRole: Codable {
    /// name of the role, max 100 characters
    public var name: String
    
    /// bitwise value of the enabled/disabled permissions
    public var permissions: Permissions = .init(rawValue: 0)
    
    /// RGB color value
    public var color: Int = 0
    
    /// whether the role should be displayed separately in the sidebar
    public var hoist: Bool = false
    
    /// the role's icon image (if the guild has the ROLE_ICONS feature)
    public var icon: Data?
    
    /// the role's unicode emoji as a standard emoji (if the guild has the ROLE_ICONS feature)
    public var unicodeEmoji: String?
    
    /// whether the role should be mentionable
    public var mentionable: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case permissions = "permissions"
        case color = "color"
        case hoist = "hoist"
        case icon = "icon"
        case unicodeEmoji = "unicode_emoji"
        case mentionable = "mentionable"
    }
    
    public init(name: String,
                permissions: Permissions,
                color: Int,
                hoist: Bool,
                icon: Data? = nil,
                unicodeEmoji: String? = nil,
                mentionable: Bool) {
        self.name = name
        self.permissions = permissions
        self.color = color
        self.hoist = hoist
        self.icon = icon
        self.unicodeEmoji = unicodeEmoji
        self.mentionable = mentionable
    }
}
