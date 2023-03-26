//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public enum StagePrivacyLevel: Int, Codable {
    /// The Stage instance is visible publicly. (deprecated)
    case `public` = 1
    /// The Stage instance is visible to only guild members.
    case guildOnly = 2
}
