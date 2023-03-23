//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct MessageFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// this message has been published to subscribed channels (via Channel Following)
    public static let crossposted = Self(rawValue: 1 << 0)
    
    /// this message originated from a message in another channel (via Channel Following)
    public static let isCrosspost = Self(rawValue: 1 << 1)
    
    /// do not include any embeds when serializing this message
    public static let suppressEmbeds = Self(rawValue: 1 << 2)
    
    /// the source message for this crosspost has been deleted (via Channel Following)
    public static let sourceMessageDeleted = Self(rawValue: 1 << 3)
    
    /// this message came from the urgent message system
    public static let urgent = Self(rawValue: 1 << 4)
    
    /// this message has an associated thread, with the same id as the message
    public static let hasThread = Self(rawValue: 1 << 5)
    
    /// this message is only visible to the user who invoked the Interaction
    public static let ephemeral = Self(rawValue: 1 << 6)
    
    /// this message is an Interaction Response and the bot is "thinking"
    public static let loading = Self(rawValue: 1 << 7)
    
    /// this message failed to mention some roles and add their members to the thread
    public static let failedToMentionSomeRolesInThread = Self(rawValue: 1 << 8)
    
    /// this message will not trigger push and desktop notifications
    public static let suppressNotifications = Self(rawValue: 1 << 12)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
