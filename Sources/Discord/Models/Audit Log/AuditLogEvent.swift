//
//  AuditLogEvent.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum AuditLogEvent: Int, Codable {
    /// Server settings were updated
    case guildUpdate = 1
    /// Channel was created
    case channelCreate = 10
    /// Channel settings were updated
    case channelUpdate = 11
    /// Channel was deleted
    case channelDelete = 12
    /// Permission overwrite was added to a channel
    case channelOverwriteCreate = 13
    /// Permission overwrite was updated for a channel
    case channelOverwriteUpdate = 14
    /// Permission overwrite was deleted from a channel
    case channelOverwriteDelete = 15
    /// Member was removed from server
    case memberKick = 20
    /// Members were pruned from server
    case memberPrune = 21
    /// Member was banned from server
    case memberBanAdd = 22
    /// Server ban was lifted for a member
    case memberBanRemove = 23
    /// Member was updated in server
    case memberUpdate = 24
    /// Member was added or removed from a role
    case memberRoleUpdate = 25
    /// Member was moved to a different voice channel
    case memberMove = 26
    /// Member was disconnected from a voice channel
    case memberDisconnect = 27
    /// Bot user was added to server
    case botAdd = 28
    /// Role was created
    case roleCreate = 30
    /// Role was edited
    case roleUpdate = 31
    /// Role was deleted
    case roleDelete = 32
    /// Server invite was created
    case inviteCreate = 40
    /// Server invite was updated
    case inviteUpdate = 41
    /// Server invite was deleted
    case inviteDelete = 42
    /// Webhook was created
    case webhookCreate = 50
    /// Webhook properties or channel were updated
    case webhookUpdate = 51
    /// Webhook was deleted
    case webhookDelete = 52
    /// Emoji was created
    case emojiCreate = 60
    /// Emoji name was updated
    case emojiUpdate = 61
    /// Emoji was deleted
    case emojiDelete = 62
    /// Single message was deleted
    case messageDelete = 72
    /// Multiple messages were deleted
    case messageBulkDelete = 73
    /// Message was pinned to a channel
    case messagePin = 74
    /// Message was unpinned from a channel
    case messageUnpin = 75
    /// App was added to server
    case integrationCreate = 80
    /// App was updated (as an example, its scopes were updated)
    case integrationUpdate = 81
    /// App was removed from server
    case integrationDelete = 82
    /// Stage instance was created (stage channel becomes live)
    case stageInstanceCreate = 83
    /// Stage instance details were updated
    case stageInstanceUpdate = 84
    /// Stage instance was deleted (stage channel no longer live)
    case stageInstanceDelete = 85
    /// Sticker was created
    case stickerCreate = 90
    /// Sticker details were updated
    case stickerUpdate = 91
    /// Sticker was deleted
    case stickerDelete = 92
    /// Event was created
    case guildScheduledEventCreate = 100
    /// Event was updated
    case guildScheduledEventUpdate = 101
    /// Event was cancelled
    case guildScheduledEventDelete = 102
    /// Thread was created in a channel
    case threadCreate = 110
    /// Thread was updated
    case threadUpdate = 111
    /// Thread was deleted
    case threadDelete = 112
    /// Permissions were updated for a command
    case applicationCommandPermissionUpdate = 121
    /// Auto Moderation rule was created
    case autoModerationRuleCreate = 140
    /// Auto Moderation rule was updated
    case autoModerationRuleUpdate = 141
    /// Auto Moderation rule was deleted
    case autoModerationRuleDelete = 142
    /// Message was blocked by Auto Moderation
    case autoModerationBlockMessage = 143
    /// Message was flagged by Auto Moderation
    case autoModerationFlagToChannel = 144
    /// Member was timed out by Auto Moderation
    case autoModerationUserCommunicationDisabled = 145
    /// Server guide updated
    case serverGuideUpdated = 191
}
