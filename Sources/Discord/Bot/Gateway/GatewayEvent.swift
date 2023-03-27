//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public enum GatewayEvent {
    /// Contains the initial state information
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#ready](https://discord.com/developers/docs/topics/gateway-events#ready)
    case ready(GatewayReady)
    
    /// Response to Resume
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#resumed](https://discord.com/developers/docs/topics/gateway-events#resumed)
    case resumed(GatewayEventData); #warning("Incomplete")
    
    /// Application command permission was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#application-command-permissions-update](https://discord.com/developers/docs/topics/gateway-events#application-command-permissions-update)
    case applicationCommandPermissionsUpdate(Command.Permissions)
    
    /// Auto Moderation rule was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-create](https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-create)
    case autoModerationRuleCreate(AutoModerationRule)
    
    /// Auto Moderation rule was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-update](https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-update)
    case autoModerationRuleUpdate(AutoModerationRule)
    
    /// Auto Moderation rule was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-delete](https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-delete)
    case autoModerationRuleDelete(AutoModerationRule)
    
    /// Auto Moderation rule was triggered and an action was executed (e.g. a message was blocked)
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#auto-moderation-action-execution](https://discord.com/developers/docs/topics/gateway-events#auto-moderation-action-execution)
    case autoModerationActionExecution(AutoModerationActionExecution)
    
    /// New guild channel created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#channel-create](https://discord.com/developers/docs/topics/gateway-events#channel-create)
    case channelCreate(Channel)
    
    /// Channel was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#channel-update](https://discord.com/developers/docs/topics/gateway-events#channel-update)
    case channelUpdate(Channel)
    
    /// Channel was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#channel-delete](https://discord.com/developers/docs/topics/gateway-events#channel-delete)
    case channelDelete(Channel)
    
    /// Message was pinned or unpinned
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#channel-pins-update](https://discord.com/developers/docs/topics/gateway-events#channel-pins-update)
    case channelPinsUpdate(ChannelPinsUpdate)
    
    /// Thread created, also sent when being added to a private thread
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#thread-create](https://discord.com/developers/docs/topics/gateway-events#thread-create)
    case threadCreate(Channel)
    
    /// Thread was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#thread-update](https://discord.com/developers/docs/topics/gateway-events#thread-update)
    case threadUpdate(Channel)
    
    /// Thread was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#thread-delete](https://discord.com/developers/docs/topics/gateway-events#thread-delete)
    case threadDelete(Channel)
    
    /// Sent when gaining access to a channel, contains all active threads in that channel
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#thread-list-sync](https://discord.com/developers/docs/topics/gateway-events#thread-list-sync)
    case threadListSync(ThreadListSync) // untested
    
    /// Thread member for the current user was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#thread-member-update](https://discord.com/developers/docs/topics/gateway-events#thread-member-update)
    case threadMemberUpdate(GatewayThreadMember) // untested
    
    /// Some user(s) were added to or removed from a thread
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#thread-members-update](https://discord.com/developers/docs/topics/gateway-events#thread-members-update)
    case threadMembersUpdate(ThreadMembersUpdate); // untested
    
    /// Lazy-load for unavailable guild, guild became available, or user joined a new guild
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-create](https://discord.com/developers/docs/topics/gateway-events#guild-create)
    case guildCreate(GatewayGuild) // untested
    
    /// Guild was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-update](https://discord.com/developers/docs/topics/gateway-events#guild-update)
    case guildUpdate(Guild)
    
    /// Guild became unavailable, or user left/was removed from a guild
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-delete](https://discord.com/developers/docs/topics/gateway-events#guild-delete)
    case guildDelete(UnavailableGuild) // untested
    
    /// A guild audit log entry was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-audit-log-entry-create](https://discord.com/developers/docs/topics/gateway-events#guild-audit-log-entry-create)
    case guildAuditLogEntryCreate(AuditLogEntry) // untested
    
    /// User was banned from a guild
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-ban-add](https://discord.com/developers/docs/topics/gateway-events#guild-ban-add)
    case guildBanAdd(GatewayGuildBan) // untested
    
    /// User was unbanned from a guild
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-ban-remove](https://discord.com/developers/docs/topics/gateway-events#guild-ban-remove)
    case guildBanRemove(GatewayGuildBan) // untested
    
    /// Guild emojis were updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-emojis-update](https://discord.com/developers/docs/topics/gateway-events#guild-emojis-update)
    case guildEmojisUpdate(GatewayGuildEmoji) // untested
    
    /// Guild stickers were updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-stickers-update](https://discord.com/developers/docs/topics/gateway-events#guild-stickers-update)
    case guildStickersUpdate(GatewayGuildSticker) // untested
    
    /// Guild integration was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-integrations-update](https://discord.com/developers/docs/topics/gateway-events#guild-integrations-update)
    case guildIntegrationsUpdate(GatewayGuildIntegration) // untested
    
    /// New user joined a guild
    /// - Important: If using Gateway Intents, the `GUILD_MEMBERS` intent will be required to receive this event.
    ///
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-member-add](https://discord.com/developers/docs/topics/gateway-events#guild-member-add)
    case guildMemberAdd(GatewayGuildMember) // untested
    
    /// User was removed from a guild
    /// - Important: If using Gateway Intents, the `GUILD_MEMBERS` intent will be required to receive this event.
    ///
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-member-remove](https://discord.com/developers/docs/topics/gateway-events#guild-member-remove)
    case guildMemberRemove(GatewayGuildMemberRemove) // untested
    
    /// Guild member was updated
    /// - Important: If using Gateway Intents, the `GUILD_MEMBERS` intent will be required to receive this event.
    ///
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-member-update](https://discord.com/developers/docs/topics/gateway-events#guild-member-update)
    case guildMemberUpdate(GatewayGuildMemberUpdate) // untested
    
    /// Response to Request Guild Members
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-members-chunk](https://discord.com/developers/docs/topics/gateway-events#guild-members-chunk)
    case guildMembersChunk(GatewayGuildMemberChunk) // untested
    
    /// Guild role was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-role-create](https://discord.com/developers/docs/topics/gateway-events#guild-role-create)
    case guildRoleCreate(GatewayGuildRole) // untested
    
    /// Guild role was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-role-update](https://discord.com/developers/docs/topics/gateway-events#guild-role-update)
    case guildRoleUpdate(GatewayGuildRole) // untested
    
    /// Guild role was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-role-delete](https://discord.com/developers/docs/topics/gateway-events#guild-role-delete)
    case guildRoleDelete(GatewayGuildRoleDelete) // untested
    
    /// Guild scheduled event was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-create](https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-create)
    case guildScheduledEventCreate(ScheduledEvent)
    
    /// Guild scheduled event was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-update](https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-update)
    case guildScheduledEventUpdate(ScheduledEvent)
    
    /// Guild scheduled event was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-delete](https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-delete)
    case guildScheduledEventDelete(ScheduledEvent)
    
    /// User subscribed to a guild scheduled event
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-user-add](https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-user-add)
    case guildScheduledEventUserAdd(GatewayEventData); #warning("Incomplete")
    
    /// User unsubscribed from a guild scheduled event
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-user-remove](https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-user-remove)
    case guildScheduledEventUserRemove(GatewayEventData); #warning("Incomplete")
    
    /// Guild integration was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#integration-create](https://discord.com/developers/docs/topics/gateway-events#integration-create)
    case integrationCreate(GatewayEventData); #warning("Incomplete")
    
    /// Guild integration was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#integration-update](https://discord.com/developers/docs/topics/gateway-events#integration-update)
    case integrationUpdate(GatewayEventData); #warning("Incomplete")
    
    /// Guild integration was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#integration-delete](https://discord.com/developers/docs/topics/gateway-events#integration-delete)
    case integrationDelete(GatewayEventData); #warning("Incomplete")
    
    /// User used an interaction, such as an Application Command
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#interaction-create](https://discord.com/developers/docs/topics/gateway-events#interaction-create)
    case interactionCreate(GatewayEventData); #warning("Incomplete")
    
    /// Invite to a channel was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#invite-create](https://discord.com/developers/docs/topics/gateway-events#invite-create)
    case inviteCreate(GatewayEventData); #warning("Incomplete")
    
    /// Invite to a channel was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#invite-delete](https://discord.com/developers/docs/topics/gateway-events#invite-delete)
    case inviteDelete(GatewayEventData); #warning("Incomplete")
    
    /// Message was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-create](https://discord.com/developers/docs/topics/gateway-events#message-create)
    case messageCreate(GatewayEventData); #warning("Incomplete")
    
    /// Message was edited
    /// - Important: Unlike creates, message updates may contain only a subset of the full
    /// message object payload (but will always contain an ID and `channelId`).
    ///
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-update](https://discord.com/developers/docs/topics/gateway-events#message-update)
    case messageUpdate(GatewayEventData); #warning("Incomplete")
    
    /// Message was deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-delete](https://discord.com/developers/docs/topics/gateway-events#message-delete)
    case messageDelete(GatewayEventData); #warning("Incomplete")
    
    /// Multiple messages were deleted at once
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-delete-bulk](https://discord.com/developers/docs/topics/gateway-events#message-delete-bulk)
    case messageDeleteBulk(GatewayEventData); #warning("Incomplete")
    
    /// User reacted to a message
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-reaction-add](https://discord.com/developers/docs/topics/gateway-events#message-reaction-add)
    case messageReactionAdd(GatewayEventData); #warning("Incomplete")
    
    /// User removed a reaction from a message
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove](https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove)
    case messageReactionRemove(GatewayEventData); #warning("Incomplete")
    
    /// All reactions were explicitly removed from a message
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove-all](https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove-all)
    case messageReactionRemoveAll(GatewayEventData); #warning("Incomplete")
    
    /// All reactions for a given emoji were explicitly removed from a message
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove-emoji](https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove-emoji)
    case messageReactionRemoveEmoji(GatewayEventData); #warning("Incomplete")
    
    /// User was updated
    /// - Important: If you are using Gateway Intents, you must specify the `GUILD_PRESENCES` intent in order to receive Presence Update events
    ///
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#presence-update](https://discord.com/developers/docs/topics/gateway-events#presence-update)
    case presenceUpdate(GatewayEventData); #warning("Incomplete")
    
    /// Stage instance was created
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#stage-instance-create](https://discord.com/developers/docs/topics/gateway-events#stage-instance-create)
    case stageInstanceCreate(StageInstance)
    
    /// Stage instance was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#stage-instance-update](https://discord.com/developers/docs/topics/gateway-events#stage-instance-update)
    case stageInstanceUpdate(StageInstance)
    
    /// Stage instance was deleted or closed
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#stage-instance-delete](https://discord.com/developers/docs/topics/gateway-events#stage-instance-delete)
    case stageInstanceDelete(StageInstance)
    
    /// User started typing in a channel
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#typing-start](https://discord.com/developers/docs/topics/gateway-events#typing-start)
    case typingStart(GatewayEventData); #warning("Incomplete")
    
    /// Properties about the user changed
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#user-update](https://discord.com/developers/docs/topics/gateway-events#user-update)
    case userUpdate(GatewayEventData); #warning("Incomplete")
    
    /// Someone joined, left, or moved a voice channel
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#voice-state-update](https://discord.com/developers/docs/topics/gateway-events#voice-state-update)
    case voiceStateUpdate(GatewayEventData); #warning("Incomplete")
    
    /// Guild's voice server was updated
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#voice-server-update](https://discord.com/developers/docs/topics/gateway-events#voice-server-update)
    case voiceServerUpdate(GatewayVoiceServerUpdate) // untested
    
    /// Guild channel webhook was created, update, or deleted
    /// > Discord Reference [https://discord.com/developers/docs/topics/gateway-events#webhooks-update](https://discord.com/developers/docs/topics/gateway-events#webhooks-update)
    case webhooksUpdate(WebhookUpdate) // untested
    
    public init?(jsonObject: [String: Any]) {
        guard let typeCode = jsonObject["t"] as? String,
              let data = jsonObject["d"] else {
            print("Unrecognised Event:", jsonObject["t"] ?? "")
            return nil
        }
        
        print(typeCode)
        
        switch typeCode {
        case "READY": self = .ready(.decode(data))
//        case "RESUMED": return .resumed(.decode(data))
        case "APPLICATION_COMMAND_PERMISSIONS_UPDATE": self = .applicationCommandPermissionsUpdate(.decode(data))
        case "AUTO_MODERATION_RULE_CREATE": self = .autoModerationRuleCreate(.decode(data))
        case "AUTO_MODERATION_RULE_UPDATE": self = .autoModerationRuleUpdate(.decode(data))
        case "AUTO_MODERATION_RULE_DELETE": self = .autoModerationRuleDelete(.decode(data))
        case "AUTO_MODERATION_ACTION_EXECUTION": self = .autoModerationActionExecution(.decode(data))
        case "CHANNEL_CREATE": self = .channelCreate(.decode(data))
        case "CHANNEL_UPDATE": self = .channelUpdate(.decode(data))
        case "CHANNEL_DELETE": self = .channelDelete(.decode(data))
        case "CHANNEL_PINS_UPDATE": self = .channelPinsUpdate(.decode(data))
        case "THREAD_CREATE": self = .threadCreate(.decode(data))
        case "THREAD_UPDATE": self = .threadUpdate(.decode(data))
        case "THREAD_DELETE": self = .threadDelete(.decode(data))
        case "THREAD_LIST_SYNC": self = .threadListSync(.decode(data))
        case "THREAD_MEMBER_UPDATE": self = .threadMemberUpdate(.decode(data))
        case "THREAD_MEMBERS_UPDATE": self = .threadMembersUpdate(.decode(data))
        case "GUILD_CREATE": self = .guildCreate(.decode(data))
        case "GUILD_UPDATE": self = .guildUpdate(.decode(data))
        case "GUILD_DELETE": self = .guildDelete(.decode(data))
        case "GUILD_BAN_ADD": self = .guildBanAdd(.decode(data))
        case "GUILD_BAN_REMOVE": self = .guildBanRemove(.decode(data))
        case "GUILD_EMOJIS_UPDATE": self = .guildEmojisUpdate(.decode(data))
        case "GUILD_STICKERS_UPDATE": self = .guildStickersUpdate(.decode(data))
        case "GUILD_INTEGRATIONS_UPDATE": self = .guildIntegrationsUpdate(.decode(data))
        case "GUILD_MEMBER_ADD": self = .guildMemberAdd(.decode(data))
        case "GUILD_MEMBER_REMOVE": self = .guildMemberRemove(.decode(data))
        case "GUILD_MEMBER_UPDATE": self = .guildMemberUpdate(.decode(data))
        case "GUILD_MEMBERS_CHUNK": self = .guildMembersChunk(.decode(data))
        case "GUILD_ROLE_CREATE": self = .guildRoleCreate(.decode(data))
        case "GUILD_ROLE_UPDATE": self = .guildRoleUpdate(.decode(data))
        case "GUILD_ROLE_DELETE": self = .guildRoleDelete(.decode(data))
        case "GUILD_SCHEDULED_EVENT_CREATE": self = .guildScheduledEventCreate(.decode(data))
        case "GUILD_SCHEDULED_EVENT_UPDATE": self = .guildScheduledEventUpdate(.decode(data))
        case "GUILD_SCHEDULED_EVENT_DELETE": self = .guildScheduledEventDelete(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_USER_ADD": self = .guildScheduledEventUserAdd(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_USER_REMOVE": self = .guildScheduledEventUserRemove(.decode(data))
        case "GUILD_AUDIT_LOG_ENTRY_CREATE": self = .guildAuditLogEntryCreate(.decode(data))
//        case "INTEGRATION_CREATE": self = .integrationCreate(.decode(data))
//        case "INTEGRATION_UPDATE": self = .integrationUpdate(.decode(data))
//        case "INTEGRATION_DELETE": self = .integrationDelete(.decode(data))
//        case "INTERACTION_CREATE": self = .interactionCreate(.decode(data))
//        case "INVITE_CREATE": self = .inviteCreate(.decode(data))
//        case "INVITE_DELETE": self = .inviteDelete(.decode(data))
//        case "MESSAGE_CREATE": self = .messageCreate(.decode(data))
//        case "MESSAGE_UPDATE": self = .messageUpdate(.decode(data))
//        case "MESSAGE_DELETE": self = .messageDelete(.decode(data))
//        case "MESSAGE_DELETE_BULK": self = .messageDeleteBulk(.decode(data))
//        case "MESSAGE_REACTION_ADD": self = .messageReactionAdd(.decode(data))
//        case "MESSAGE_REACTION_REMOVE": self = .messageReactionRemove(.decode(data))
//        case "MESSAGE_REACTION_REMOVE_ALL": self = .messageReactionRemoveAll(.decode(data))
//        case "MESSAGE_REACTION_REMOVE_EMOJI": self = .messageReactionRemoveEmoji(.decode(data))
//        case "PRESENCE_UPDATE": self = .presenceUpdate(.decode(data))
        case "STAGE_INSTANCE_CREATE": self = .stageInstanceCreate(.decode(data))
        case "STAGE_INSTANCE_DELETE": self = .stageInstanceDelete(.decode(data))
        case "STAGE_INSTANCE_UPDATE": self = .stageInstanceUpdate(.decode(data))
//        case "TYPING_START": self = .typingStart(.decode(data))
//        case "USER_UPDATE": self = .userUpdate(.decode(data))
//        case "VOICE_STATE_UPDATE": self = .voiceStateUpdate(.decode(data))
        case "VOICE_SERVER_UPDATE": self = .voiceServerUpdate(.decode(data))
        case "WEBHOOKS_UPDATE": self = .webhooksUpdate(.decode(data))
        default:
            print("Unrecognised case")
            return nil
        }
    }
}

public struct GatewayGuildRole: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    /// Role that was created
    public var role: Role
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case role = "role"
    }
}

public struct GatewayGuildRoleDelete: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    /// ID of the role
    public var roleId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case roleId = "role_id"
    }
}
