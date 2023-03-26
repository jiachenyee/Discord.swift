//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct SelectOption: Codable {
    /// User-facing name of the option; max 100 characters
    public var label: String
    
    /// Dev-defined value of the option; max 100 characters
    public var value: String
    
    /// Additional description of the option; max 100 characters
    public var description: String?
    
    /// id, name, and animated
    public var emoji: Emoji?
    
    /// Will show this option as selected by default
    public var defaultValue: Bool?
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case value = "value"
        case description = "description"
        case emoji = "emoji"
        case defaultValue = "default"
    }
    
    public init(label: String, value: String, description: String? = nil, emoji: Emoji? = nil, defaultValue: Bool? = nil) {
        self.label = label
        self.value = value
        self.description = description
        self.emoji = emoji
        self.defaultValue = defaultValue
    }
    
    public static func option(label: String,
                              value: String,
                              description: String? = nil,
                              emoji: Emoji? = nil,
                              defaultValue: Bool? = nil) -> Self {
        Self(label: label,
             value: value,
             description: description,
             emoji: emoji,
             defaultValue: defaultValue)
    }
}
