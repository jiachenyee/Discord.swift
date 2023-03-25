//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct UserFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// Discord Employee
    public static let staff = Self(rawValue: 1 << 0)
    
    /// Partnered Server Owner
    public static let partner = Self(rawValue: 1 << 1)
    
    /// HypeSquad Events Member
    public static let hypesquad = Self(rawValue: 1 << 2)
    
    /// Bug Hunter Level 1
    public static let bugHunterLevel1 = Self(rawValue: 1 << 3)
    
    /// House Bravery Member
    public static let hypesquadBravery = Self(rawValue: 1 << 6)
    
    /// House Brilliance Member
    public static let hypesquadBrilliance = Self(rawValue: 1 << 7)
    
    /// House Balance Member
    public static let hypesquadBalance = Self(rawValue: 1 << 8)
    
    /// Early Nitro Supporter
    public static let premiumEarlySupporter = Self(rawValue: 1 << 9)
    
    /// User is a team
    public static let teamPseudoUser = Self(rawValue: 1 << 10)
    
    /// Bug Hunter Level 2
    public static let bugHunterLevel2 = Self(rawValue: 1 << 14)
    
    /// Verified Bot
    public static let verifiedBot = Self(rawValue: 1 << 16)
    
    /// Early Verified Bot Developer
    public static let verifiedDeveloper = Self(rawValue: 1 << 17)
    
    /// Moderator Programs Alumni
    public static let certifiedModerator = Self(rawValue: 1 << 18)
    
    /// Bot uses only HTTP interactions and is shown in the online member list
    public static let botHttpInteractions = Self(rawValue: 1 << 19)
    
    /// User is an Active Developer
    public static let activeDeveloper = Self(rawValue: 1 << 22)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
