//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct WelcomeScreen: Codable {
    /// the server description shown in the welcome screen
    var description: String?
    
    /// the channels shown in the welcome screen, up to 5
    var welcomeChannels: [WelcomeScreenChannel]
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case welcomeChannels = "welcome_channels"
    }
}
