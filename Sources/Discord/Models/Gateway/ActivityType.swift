//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public enum ActivityType: Int, Codable {
    /// Playing {name}    "Playing Rocket League"
    case game = 0
    /// Streaming {details}    "Streaming Rocket League"
    case streaming = 1
    /// Listening to {name}    "Listening to Spotify"
    case listening = 2
    /// Watching {name}    "Watching YouTube Together"
    case watching = 3
    
    case custom = 4
    
    /// Competing in {name}    "Competing in Arena World Champions"
    case competing = 5
}
