//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayActivity: GatewayEventData {
    /// Activity's name
    public var name: String
    
    /// Activity type
    public var type: ActivityType
    
    /// Stream URL, is validated when type is 1
    public var url: String?
    
    /// Unix timestamp (in milliseconds) of when the activity was added to the user's session
    public var createdAt: Int
    
    /// Unix timestamps for start and/or end of the game
    public var timestamps: ActivityTimestamps?
    
    /// Application ID for the game
    public var applicationId: Snowflake?
    
    /// What the player is currently doing
    public var details: String?
    
    /// User's current party status
    public var state: String?
    
    /// Emoji used for a custom status
    public var emoji: ActivityEmoji?
    
    /// Information for the current party of the player
    public var party: ActivityParty?
    
    /// Images for the presence and their hover texts
    public var assets: ActivityAssets?
    
    /// Secrets for Rich Presence joining and spectating
    public var secrets: ActivitySecrets?
    
    /// Whether or not the activity is an instanced game session
    public var instance: Bool?
    
    /// Activity flags, describes what the payload includes
    public var flags: ActivityFlags?
    
    /// Custom buttons shown in the Rich Presence (max 2)
    public var buttons: [ActivityButton]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case url = "url"
        case createdAt = "created_at"
        case timestamps = "timestamps"
        case applicationId = "application_id"
        case details = "details"
        case state = "state"
        case emoji = "emoji"
        case party = "party"
        case assets = "assets"
        case secrets = "secrets"
        case instance = "instance"
        case flags = "flags"
        case buttons = "buttons"
    }
}

public struct ActivityTimestamps: GatewayEventData {
    /// Unix time (in milliseconds) of when the activity started
    public var start: Int?
    
    /// Unix time (in milliseconds) of when the activity ends
    public var end: Int?
}

public struct ActivityEmoji: GatewayEventData {
    /// Name of the emoji
    public var name: String
    /// ID of the emoji
    public var id: Snowflake?
    /// Whether the emoji is animated
    public var animated: Bool?
}

public struct ActivityParty: GatewayEventData {
    /// ID of the party
    public var id: String?
    
    /// (`current_size`, `max_size`)    Used to show the party's current and maximum size
    public var size: [Int]
}

public struct ActivityAssets: GatewayEventData {
    /// See Activity Asset Image
    public var largeImage: String?
    
    /// Text displayed when hovering over the large image of the activity
    public var largeText: String?
    
    /// See Activity Asset Image
    public var smallImage: String?
    
    /// Text displayed when hovering over the small image of the activity
    public var smallText: String?
    
    enum CodingKeys: String, CodingKey {
        case largeImage = "large_image"
        case largeText = "large_text"
        case smallImage = "small_image"
        case smallText = "small_text"
    }
}

public struct ActivitySecrets: GatewayEventData {
    /// Secret for joining a party
    public var join: String?
    
    /// Secret for spectating a game
    public var spectate: String?
    
    /// Secret for a specific instanced match
    public var match: String?
}

public struct ActivityFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static var instance = Self(rawValue: 1 << 0)
    public static var join = Self(rawValue: 1 << 1)
    public static var spectate = Self(rawValue: 1 << 2)
    public static var joinRequest = Self(rawValue: 1 << 3)
    public static var sync = Self(rawValue: 1 << 4)
    public static var play = Self(rawValue: 1 << 5)
    public static var partyPrivacyFriends = Self(rawValue: 1 << 6)
    public static var partyPrivacyVoiceChannel = Self(rawValue: 1 << 7)
    public static var embedded = Self(rawValue: 1 << 8)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}

public struct ActivityButton: GatewayEventData {
    /// Text shown on the button (1-32 characters)
    public var label: String
    
    /// URL opened when clicking the button (1-512 characters)
    public var url: String
}
