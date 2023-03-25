//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyGuildRoleRequest: Codable {
    /// name of the role, max 100 characters
    public var name: String?
    /// bitwise value of the enabled/disabled permissions
    public var permissions: Permissions?
    /// RGB color value
    public var color: Int?
    /// whether the role should be displayed separately in the sidebar
    public var hoist: Bool?
    /// data    the role's icon image (if the guild has the ROLE_ICONS feature)
    public var icon: Data?
    /// the role's unicode emoji as a standard emoji (if the guild has the ROLE_ICONS feature)
    public var unicodeEmoji: String?
    /// whether the role should be mentionable
    public var mentionable: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case permissions = "permissions"
        case color = "color"
        case hoist = "hoist"
        case icon = "icon"
        case unicodeEmoji = "unicode_emoji"
        case mentionable = "mentionable"
    }
    
    public init(name: String? = nil,
                permissions: Permissions? = nil,
                color: Int? = nil,
                hoist: Bool? = nil,
                icon: Data? = nil,
                unicodeEmoji: String? = nil,
                mentionable: Bool? = nil) {
        self.name = name
        self.permissions = permissions
        self.color = color
        self.hoist = hoist
        self.icon = icon
        self.unicodeEmoji = unicodeEmoji
        self.mentionable = mentionable
    }
    
    public static func modifying(name: String? = nil,
                                 permissions: Permissions? = nil,
                                 color: Int? = nil,
                                 hoist: Bool? = nil,
                                 icon: Data? = nil,
                                 unicodeEmoji: String? = nil,
                                 mentionable: Bool? = nil) -> Self {
        Self(name: name,
             permissions: permissions,
             color: color,
             hoist: hoist,
             icon: icon,
             unicodeEmoji: unicodeEmoji,
             mentionable: mentionable)
    }
}
