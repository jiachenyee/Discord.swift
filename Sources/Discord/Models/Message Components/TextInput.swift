//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct TextInput: Codable {
    /// 4 for a text input
    public var type: ComponentType = .textInput
    
    /// Developer-defined identifier for the input; max 100 characters
    public var customId: String
    
    /// The Text Input Style
    public var style: TextInputStyle
    
    /// Label for this component; max 45 characters
    public var label: String
    
    /// Minimum input length for a text input; min 0, max 4000
    public var minLength: Int?
    
    /// Maximum input length for a text input; min 1, max 4000
    public var maxLength: Int?
    
    /// Whether this component is required to be filled (defaults to true)
    public var required: Bool?
    
    /// Pre-filled value for this component; max 4000 characters
    public var value: String?
    
    /// Custom placeholder text if the input is empty; max 100 characters
    public var placeholder: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case customId = "custom_id"
        case style = "style"
        case label = "label"
        case minLength = "min_length"
        case maxLength = "max_length"
        case required = "required"
        case value = "value"
        case placeholder = "placeholder"
    }
    
    public init(customId: String,
                style: TextInputStyle,
                label: String,
                minLength: Int? = nil,
                maxLength: Int? = nil,
                required: Bool? = nil,
                value: String? = nil,
                placeholder: String? = nil) {
        self.type = .textInput
        self.customId = customId
        self.style = style
        self.label = label
        self.minLength = minLength
        self.maxLength = maxLength
        self.required = required
        self.value = value
        self.placeholder = placeholder
    }
    
    public static func shortText(customId: String,
                                 label: String,
                                 minLength: Int? = nil,
                                 maxLength: Int? = nil,
                                 required: Bool? = nil,
                                 value: String? = nil,
                                 placeholder: String? = nil) -> Self {
        Self(customId: customId,
             style: .short,
             label: label,
             minLength: minLength,
             maxLength: maxLength,
             required: required,
             value: value,
             placeholder: placeholder)
    }
    
    public static func paragraph(customId: String,
                                 label: String,
                                 minLength: Int? = nil,
                                 maxLength: Int? = nil,
                                 required: Bool? = nil,
                                 value: String? = nil,
                                 placeholder: String? = nil) -> Self {
        Self(customId: customId,
             style: .paragraph,
             label: label,
             minLength: minLength,
             maxLength: maxLength,
             required: required,
             value: value,
             placeholder: placeholder)
    }
}
