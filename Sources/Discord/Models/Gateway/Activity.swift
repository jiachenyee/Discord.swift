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
    
    public enum ActivityType: Int, Codable {
        /// Playing {name}    "Playing Rocket League"
        case game = 0
        /// Streaming {details}    "Streaming Rocket League"
        case streaming = 1
        /// Listening to {name}    "Listening to Spotify"
        case listening = 2
        /// Watching {name}    "Watching YouTube Together"
        case watching = 3
        /// Competing in {name}    "Competing in Arena World Champions"
        case competing = 5
    }
    
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
