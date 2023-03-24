//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum PremiumTier: Int, Codable {
    /// guild has not unlocked any Server Boost perks
    case none = 0
    /// guild has unlocked Server Boost level 1 perks
    case tier1 = 1
    /// guild has unlocked Server Boost level 2 perks
    case tier2 = 2
    /// guild has unlocked Server Boost level 3 perks
    case tier3 = 3
}
