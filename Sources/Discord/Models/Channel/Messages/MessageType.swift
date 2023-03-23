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
