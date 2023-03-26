//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ApplicationFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// Intent required for bots in 100 or more servers to receive `presence_update` events
    public static let gatewayPresence = Self(rawValue: 1 << 12)
    
    /// Intent required for bots in under 100 servers to receive `presence_update` events, found in Bot Settings
    public static let gatewayPresenceLimited = Self(rawValue: 1 << 13)
    
    /// Intent required for bots in 100 or more servers to receive member-related events like `guild_member_add`. See list of member-related events under `GUILD_MEMBERS`
    public static let gatewayGuildMembers = Self(rawValue: 1 << 14)
    
    /// Intent required for bots in under 100 servers to receive member-related events like `guild_member_add`, found in Bot Settings. See list of member-related events under `GUILD_MEMBERS`
    public static let gatewayGuildMembersLimited = Self(rawValue: 1 << 15)
    
    /// Indicates unusual growth of an app that prevents verification
    public static let verificationPendingGuildLimit = Self(rawValue: 1 << 16)
    
    /// Indicates if an app is embedded within the Discord client (currently unavailable publicly)
    public static let embedded = Self(rawValue: 1 << 17)
    
    /// Intent required for bots in 100 or more servers to receive message content
    public static let gatewayMessageContent = Self(rawValue: 1 << 18)
    
    /// Intent required for bots in under 100 servers to receive message content, found in Bot Settings
    public static let gatewayMessageContentLimited = Self(rawValue: 1 << 19)
    
    /// Indicates if an app has registered global application commands
    public static let applicationCommandBadge = Self(rawValue: 1 << 23)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
