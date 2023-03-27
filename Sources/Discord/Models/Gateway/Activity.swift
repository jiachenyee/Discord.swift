//
//  Activity.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Activity: Codable {
    
    /// Activity's name
    public var name: String
    
    /// Activity type
    public var type: ActivityType
    
    /// Stream URL
    public var url: String?
    
    public init(name: String, type: ActivityType, url: String? = nil) {
        self.name = name
        self.type = type
        self.url = url
    }
    
    public static func playing(_ name: String) -> Self {
        Self(name: name, type: .game)
    }
    
    public static func listening(to name: String) -> Self {
        Self(name: name, type: .listening)
    }
    
    public static func streaming(_ name: String, url: String? = nil) -> Self {
        Self(name: name, type: .streaming, url: url)
    }
    
    public static func watching(_ name: String) -> Self {
        Self(name: name, type: .watching)
    }
    
    public static func competing(in name: String) -> Self {
        Self(name: name, type: .competing)
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case url = "url"
    }
}
