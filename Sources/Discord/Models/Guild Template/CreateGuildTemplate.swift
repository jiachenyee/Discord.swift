//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct CreateGuildTemplate: Codable {
    /// name of the template (1-100 characters)
    public var name: String
    /// description for the template (0-120 characters)
    public var description: String?
    
    public init(name: String, description: String? = nil) {
        self.name = name
        self.description = description
    }
    
    public static func new(name: String,
                           description: String? = nil) -> Self {
        Self(name: name,
             description: description)
    }
}
