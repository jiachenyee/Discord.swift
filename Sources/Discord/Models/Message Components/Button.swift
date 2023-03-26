//
//  File 2.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct Button: Codable {
    /// 2 for a button
    public var type: ComponentType = .button
    
    /// A button style
    public var style: ButtonStyle
    
    /// Text that appears on the button; max 80 characters
    public var label: String?
    
    /// name, id, and animated
    public var emoji: Emoji?
    
    /// Developer-defined identifier for the button; max 100 characters
    public var customId: String?
    
    /// URL for link-style buttons
    public var url: String?
    
    /// Whether the button is disabled (defaults to false)
    public var disabled: Bool?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case style = "style"
        case label = "label"
        case emoji = "emoji"
        case customId = "custom_id"
        case url = "url"
        case disabled = "disabled"
    }
    
    public static func primary(label: String? = nil,
                               emoji: Emoji? = nil,
                               customId: String,
                               disabled: Bool? = nil) -> Self {
        Self(style: .primary,
             label: label,
             emoji: emoji,
             customId: customId,
             disabled: disabled)
    }
    
    public static func secondary(label: String? = nil,
                                 emoji: Emoji? = nil,
                                 customId: String,
                                 disabled: Bool? = nil) -> Self {
        Self(style: .secondary,
             label: label,
             emoji: emoji,
             customId: customId,
             disabled: disabled)
    }
    
    public static func success(label: String? = nil,
                               emoji: Emoji? = nil,
                               customId: String,
                               disabled: Bool? = nil) -> Self {
        Self(style: .success,
             label: label,
             emoji: emoji,
             customId: customId,
             disabled: disabled)
    }
    
    public static func danger(label: String? = nil,
                              emoji: Emoji? = nil,
                              customId: String,
                              disabled: Bool? = nil) -> Self {
        Self(style: .danger,
             label: label,
             emoji: emoji,
             customId: customId,
             disabled: disabled)
    }
    
    public static func link(label: String? = nil,
                            emoji: Emoji? = nil,
                            url: String? = nil,
                            disabled: Bool? = nil) -> Self {
        Self(style: .link,
             label: label,
             emoji: emoji,
             url: url,
             disabled: disabled)
    }
}
