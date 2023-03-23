//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct EmbedField: Codable {
    /// name of the field
    public var name: String
    
    /// value of the field
    public var value: String
    
    /// whether or not this field should display inline
    public var inline: Bool?
    
    public init(name: String, value: String, inline: Bool? = nil) {
        self.name = name
        self.value = value
        self.inline = inline
    }
    
    public static func field(name: String,
                             value: String,
                             inline: Bool? = nil) -> Self {
        Self(name: name,
             value: value,
             inline: inline)
    }
}
