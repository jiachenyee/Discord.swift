//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyWelcomeScreen: Codable {
    /// whether the welcome screen is enabled
    public var enabled: Bool?
    
    /// channels linked in the welcome screen and their display options
    public var welcomeChannels: [WelcomeScreenChannel]?
    
    /// the server description to show in the welcome screen
    public var description: String?
    
    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case welcomeChannels = "welcome_channels"
        case description = "description"
    }
    
    public init(enabled: Bool? = nil, welcomeChannels: [WelcomeScreenChannel]? = nil, description: String? = nil) {
        self.enabled = enabled
        self.welcomeChannels = welcomeChannels
        self.description = description
    }
    
    public static func modifying(enabled: Bool? = nil,
                                 welcomeChannels: [WelcomeScreenChannel]? = nil,
                                 description: String? = nil) -> Self {
        Self(enabled: enabled,
             welcomeChannels: welcomeChannels,
             description: description)
    }
}
