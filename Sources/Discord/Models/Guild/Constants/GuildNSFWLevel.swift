//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum GuildNSFWLevel: Int, Codable {
    case `default` = 0
    case explicit = 1
    case safe = 2
    case ageRestricted = 3
}
