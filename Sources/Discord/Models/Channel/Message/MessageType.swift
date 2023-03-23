//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum MessageType: Int, Codable {
    case `default` = 0
    case recipientAdd = 1
    case recipientRemove = 2
    case call = 3
    case channelNameChange = 4
    case channelIconChange = 5
    case channelPinnedMessage = 6
    case userJoin = 7
    case guildBoost = 8
    case guildBoostTier1 = 9
    case guildBoostTier2 = 10
    case guildBoostTier3 = 11
    case channelFollowAdd = 12
    case guildDiscoveryDisqualified = 14
    case guildDiscoveryRequalified = 15
    case guildDiscoveryGracePeriodInitialWarning = 16
    case guildDiscoveryGracePeriodFinalWarning = 17
    case threadCreated = 18
    case reply = 19
    case chatInputCommand = 20
    case threadStarterMessage = 21
    case guildInviteReminder = 22
    case contextMenuCommand = 23
    case autoModerationAction = 24
    case roleSubscriptionPurchase = 25
    case interactionPremiumUpsell = 26
    case stageStart = 27
    case stageEnd = 28
    case stageSpeaker = 29
    case stageTopic = 31
    case guildApplicationPremiumSubscription = 32
}

public enum MessageActivityType: Int, Codable {
    case join = 1
    case spectate = 2
    case listen = 3
    case joinRequest = 5
}

public struct MessageFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// this message has been published to subscribed channels (via Channel Following)
    static let crossposted = Self(rawValue: 1 << 0)
    
    /// this message originated from a message in another channel (via Channel Following)
    static let isCrosspost = Self(rawValue: 1 << 1)
    
    /// do not include any embeds when serializing this message
    static let suppressEmbeds = Self(rawValue: 1 << 2)
    
    /// the source message for this crosspost has been deleted (via Channel Following)
    static let sourceMessageDeleted = Self(rawValue: 1 << 3)
    
    /// this message came from the urgent message system
    static let urgent = Self(rawValue: 1 << 4)
    
    /// this message has an associated thread, with the same id as the message
    static let hasThread = Self(rawValue: 1 << 5)
    
    /// this message is only visible to the user who invoked the Interaction
    static let ephemeral = Self(rawValue: 1 << 6)
    
    /// this message is an Interaction Response and the bot is "thinking"
    static let loading = Self(rawValue: 1 << 7)
    
    /// this message failed to mention some roles and add their members to the thread
    static let failedToMentionSomeRolesInThread = Self(rawValue: 1 << 8)
    
    /// this message will not trigger push and desktop notifications
    static let suppressNotifications = Self(rawValue: 1 << 12)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
