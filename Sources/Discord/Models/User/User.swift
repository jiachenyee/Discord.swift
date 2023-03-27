//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct User: Codable, GatewayEventData {
    
    /// the user's id
    public var id: Snowflake
    
    /// the user's username, not unique across the platform
    public var username: String
    
    /// the user's 4-digit discord-tag
    public var discriminator: String
    
    /// the user's avatar hash
    public var avatar: String?
    
    /// whether the user belongs to an OAuth2 application
    public var bot: Bool?
    
    /// whether the user is an Official Discord System user (part of the urgent message system
    public var system: Bool?
    
    /// whether the user has two factor enabled on their account
    public var mfaEnabled: Bool?
    
    /// the user's banner hash
    public var banner: String?
    
    /// the user's banner color encoded as an integer representation of hexadecimal color code
    public var accentColor: Int?
    
    /// the user's chosen language option
    public var locale: DiscordLocale?
    
    /// whether the email on this account has been verified
    public var verified: Bool?
    
    /// the user's email
    public var email: String?
    
    /// the flags on a user's account
    public var flags: UserFlags?
    
    /// the type of Nitro subscription on a user's account
    public var premiumType: PremiumType?
    
    /// the public flags on a user's account
    public var publicFlags: UserFlags?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case username = "username"
        case discriminator = "discriminator"
        case avatar = "avatar"
        case bot = "bot"
        case system = "system"
        case mfaEnabled = "mfa_enabled"
        case banner = "banner"
        case accentColor = "accent_color"
        case locale = "locale"
        case verified = "verified"
        case email = "email"
        case flags = "flags"
        case premiumType = "premium_type"
        case publicFlags = "public_flags"
    }
}
