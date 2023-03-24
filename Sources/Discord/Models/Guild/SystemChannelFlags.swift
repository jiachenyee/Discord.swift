//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct SystemChannelFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// Suppress member join notifications
    public static let suppressJoinNotifications = Self(rawValue: 1 << 0)
    
    /// Suppress server boost notifications
    public static let suppressPremiumSubscriptions = Self(rawValue: 1 << 1)
    
    /// Suppress server setup tips
    public static let suppressGuildReminderNotifications = Self(rawValue: 1 << 2)
    
    /// Hide member join sticker reply buttons
    public static let suppressJoinNotificationReplies = Self(rawValue: 1 << 3)
    
    /// Suppress role subscription purchase and renewal notifications
    public static let suppressRoleSubscriptionPurchaseNotifications = Self(rawValue: 1 << 4)
    
    /// Hide role subscription sticker reply buttons
    public static let suppressRoleSubscriptionPurchaseNotificationsReplies = Self(rawValue: 1 << 5)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
