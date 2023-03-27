//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public enum GatewayEvent {
    /// https://discord.com/developers/docs/topics/gateway-events#ready
    case ready(GatewayReady)
    
    /// https://discord.com/developers/docs/topics/gateway-events#resumed
    case resumed(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#application-command-permissions-update
    case applicationCommandPermissionsUpdate(Command.Permissions)
    
    /// https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-create
    case autoModerationRuleCreate(AutoModerationRule)
    
    /// https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-update
    case autoModerationRuleUpdate(AutoModerationRule)
    
    /// https://discord.com/developers/docs/topics/gateway-events#auto-moderation-rule-delete
    case autoModerationRuleDelete(AutoModerationRule)
    
    /// https://discord.com/developers/docs/topics/gateway-events#auto-moderation-action-execution
    case autoModerationActionExecution(AutoModerationActionExecution)
    
    /// https://discord.com/developers/docs/topics/gateway-events#channel-create
    case channelCreate(Channel)
    
    /// https://discord.com/developers/docs/topics/gateway-events#channel-update
    case channelUpdate(Channel)
    
    /// https://discord.com/developers/docs/topics/gateway-events#channel-delete
    case channelDelete(Channel)
    
    /// https://discord.com/developers/docs/topics/gateway-events#channel-pins-update
    case channelPinsUpdate(ChannelPinsUpdate)
    
    /// https://discord.com/developers/docs/topics/gateway-events#thread-create
    case threadCreate(Channel)
    
    /// https://discord.com/developers/docs/topics/gateway-events#thread-update
    case threadUpdate(Channel)
    
    /// https://discord.com/developers/docs/topics/gateway-events#thread-delete
    case threadDelete(Channel)
    
    /// https://discord.com/developers/docs/topics/gateway-events#thread-list-sync
    case threadListSync(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#thread-member-update
    case threadMemberUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#thread-members-update
    case threadMembersUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-create
    case guildCreate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-update
    case guildUpdate(Guild)
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-delete
    case guildDelete(UnavailableGuild) // untested
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-audit-log-entry-create
    case guildAuditLogEntryCreate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-ban-add
    case guildBanAdd(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-ban-remove
    case guildBanRemove(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-emojis-update
    case guildEmojisUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-stickers-update
    case guildStickersUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-integrations-update
    case guildIntegrationsUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-member-add
    case guildMemberAdd(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-member-remove
    case guildMemberRemove(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-member-update
    case guildMemberUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-members-chunk
    case guildMembersChunk(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-role-create
    case guildRoleCreate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-role-update
    case guildRoleUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-role-delete
    case guildRoleDelete(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-create
    case guildScheduledEventCreate(ScheduledEvent)
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-update
    case guildScheduledEventUpdate(ScheduledEvent)
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-delete
    case guildScheduledEventDelete(ScheduledEvent)
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-user-add
    case guildScheduledEventUserAdd(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#guild-scheduled-event-user-remove
    case guildScheduledEventUserRemove(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#integration-create
    case integrationCreate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#integration-update
    case integrationUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#integration-delete
    case integrationDelete(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#interaction-create
    case interactionCreate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#invite-create
    case inviteCreate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#invite-delete
    case inviteDelete(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-create
    case messageCreate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-update
    case messageUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-delete
    case messageDelete(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-delete-bulk
    case messageDeleteBulk(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-reaction-add
    case messageReactionAdd(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove
    case messageReactionRemove(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove-all
    case messageReactionRemoveAll(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#message-reaction-remove-emoji
    case messageReactionRemoveEmoji(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#presence-update
    case presenceUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#stage-instance-create
    case stageInstanceCreate(StageInstance)
    
    /// https://discord.com/developers/docs/topics/gateway-events#stage-instance-update
    case stageInstanceUpdate(StageInstance)
    
    /// https://discord.com/developers/docs/topics/gateway-events#stage-instance-delete
    case stageInstanceDelete(StageInstance)
    
    /// https://discord.com/developers/docs/topics/gateway-events#typing-start
    case typingStart(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#user-update
    case userUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#voice-state-update
    case voiceStateUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#voice-server-update
    case voiceServerUpdate(GatewayEventData); #warning("Incomplete")
    
    /// https://discord.com/developers/docs/topics/gateway-events#webhooks-update
    case webhooksUpdate(GatewayEventData); #warning("Incomplete")
    
    public init?(jsonObject: [String: Any]) {
        guard let typeCode = jsonObject["t"] as? String,
              let data = jsonObject["d"] else {
            print("Unrecognised Event:", jsonObject["t"] ?? "")
            return nil
        }
        
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
//        case "THREAD_LIST_SYNC": self = .threadListSync(.decode(data))
//        case "THREAD_MEMBER_UPDATE": self = .threadMemberUpdate(.decode(data))
//        case "THREAD_MEMBERS_UPDATE": self = .threadMembersUpdate(.decode(data))
//        case "GUILD_CREATE": self = .guildCreate(.decode(data))
        case "GUILD_UPDATE": self = .guildUpdate(.decode(data))
        case "GUILD_DELETE": self = .guildDelete(.decode(data))
//        case "GUILD_BAN_ADD": self = .guildBanAdd(.decode(data))
//        case "GUILD_BAN_REMOVE": self = .guildBanRemove(.decode(data))
//        case "GUILD_EMOJIS_UPDATE": self = .guildEmojisUpdate(.decode(data))
//        case "GUILD_STICKERS_UPDATE": self = .guildStickersUpdate(.decode(data))
//        case "GUILD_INTEGRATIONS_UPDATE": self = .guildIntegrationsUpdate(.decode(data))
//        case "GUILD_MEMBER_ADD": self = .guildMemberAdd(.decode(data))
//        case "GUILD_MEMBER_REMOVE": self = .guildMemberRemove(.decode(data))
//        case "GUILD_MEMBER_UPDATE": self = .guildMemberUpdate(.decode(data))
//        case "GUILD_MEMBERS_CHUNK": self = .guildMembersChunk(.decode(data))
//        case "GUILD_ROLE_CREATE": self = .guildRoleCreate(.decode(data))
//        case "GUILD_ROLE_UPDATE": self = .guildRoleUpdate(.decode(data))
//        case "GUILD_ROLE_DELETE": self = .guildRoleDelete(.decode(data))
        case "GUILD_SCHEDULED_EVENT_CREATE": self = .guildScheduledEventCreate(.decode(data))
        case "GUILD_SCHEDULED_EVENT_UPDATE": self = .guildScheduledEventUpdate(.decode(data))
        case "GUILD_SCHEDULED_EVENT_DELETE": self = .guildScheduledEventDelete(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_USER_ADD": self = .guildScheduledEventUserAdd(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_USER_REMOVE": self = .guildScheduledEventUserRemove(.decode(data))
//        case "GUILD_AUDIT_LOG_ENTRY_CREATE": self = .guildAuditLogEntryCreate(.decode(data))
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
//        case "VOICE_SERVER_UPDATE": self = .voiceServerUpdate(.decode(data))
//        case "WEBHOOKS_UPDATE": self = .webhooksUpdate(.decode(data))
        default:
            print("Unrecognised case")
            return nil
        }
    }
}
