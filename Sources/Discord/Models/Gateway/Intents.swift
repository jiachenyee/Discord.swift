//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Intents: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let all: Self = [
        allGuildIntents,
        allDirectMessageIntents,
        allAutoModerationIntents,
        messageContent
    ]
    
    public static let allGuildIntents: Self = [
        guilds, guildMembers, guildModeration, guildEmojisAndStickers,
        guildIntegrations, guildWebhooks, guildInvites, guildVoiceStates,
        guildPresences, guildMessages, guildMessageReactions, guildMessageTyping,
        guildScheduledEvents
    ]
    
    public static let allDirectMessageIntents: Self = [
        directMessages, directMessageReactions, directMessageTyping
    ]
    
    public static let allAutoModerationIntents: Self = [
        autoModerationConfiguration, autoModerationExecution
    ]
    
    public static let guilds = Self(rawValue: 1 << 0)
    public static let guildMembers = Self(rawValue: 1 << 1)
    public static let guildModeration = Self(rawValue: 1 << 2)
    public static let guildEmojisAndStickers = Self(rawValue: 1 << 3)
    public static let guildIntegrations = Self(rawValue: 1 << 4)
    public static let guildWebhooks = Self(rawValue: 1 << 5)
    public static let guildInvites = Self(rawValue: 1 << 6)
    public static let guildVoiceStates = Self(rawValue: 1 << 7)
    public static let guildPresences = Self(rawValue: 1 << 8)
    public static let guildMessages = Self(rawValue: 1 << 9)
    public static let guildMessageReactions = Self(rawValue: 1 << 10)
    public static let guildMessageTyping = Self(rawValue: 1 << 11)
    public static let directMessages = Self(rawValue: 1 << 12)
    public static let directMessageReactions = Self(rawValue: 1 << 13)
    public static let directMessageTyping = Self(rawValue: 1 << 14)
    public static let messageContent = Self(rawValue: 1 << 15)
    public static let guildScheduledEvents = Self(rawValue: 1 << 16)
    public static let autoModerationConfiguration = Self(rawValue: 1 << 20)
    public static let autoModerationExecution = Self(rawValue: 1 << 21)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
