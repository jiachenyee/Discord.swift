//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct User: Codable {
    
    /// the user's id
    var id: Snowflake
    
    /// the user's username, not unique across the platform
    var username: String
    
    /// the user's 4-digit discord-tag
    var discriminator: String
    
    /// the user's avatar hash
    var avatar: String?
    
    /// whether the user belongs to an OAuth2 application
    var bot: Bool?
    
    /// whether the user is an Official Discord System user (part of the urgent message system
    var system: Bool?
    
    /// whether the user has two factor enabled on their account
    var mfa_enabled: Bool?
    
    /// the user's banner hash
    var banner: String?
    
    /// the user's banner color encoded as an integer representation of hexadecimal color code
    var accent_color: Int?
    
    /// the user's chosen language option
    var locale: DiscordLocale?
    
    /// whether the email on this account has been verified
    var verified: Bool?
    
    /// the user's email
    var email: String?
    
    /// the flags on a user's account
    var flags: UserFlags?
    
    /// the type of Nitro subscription on a user's account
    var premium_type: PremiumType?
    
    /// the public flags on a user's account
    var public_flags: UserFlags?
}

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

enum PremiumType: Int, Codable {
    case none = 0
    case nitroClassic = 1
    case nitro = 2
    case nitroBasic = 3
}
