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
    
    case applicationCommandPermissionsUpdate(Command.Permissions)
    
    case autoModerationRuleCreate(AutoModerationRule)
    case autoModerationRuleUpdate(AutoModerationRule)
    case autoModerationRuleDelete(AutoModerationRule)
    case autoModerationActionExecution(AutoModerationActionExecution)
    case channelCreate(Channel)
    case channelUpdate(Channel)
    case channelDelete(Channel)
    case channelPinsUpdate(ChannelPinsUpdate)
    case threadCreate(Channel)
    case threadUpdate(Channel)
    case threadDelete(Channel)
    
    case threadListSync(GatewayEventData); #warning("Incomplete")
    case threadMemberUpdate(GatewayEventData); #warning("Incomplete")
    case threadMembersUpdate(GatewayEventData); #warning("Incomplete")
    case guildCreate(GatewayEventData); #warning("Incomplete")
    
    case guildUpdate(Guild)
    case guildDelete(UnavailableGuild) // untested
    
    case guildBanAdd(GatewayEventData); #warning("Incomplete")
    case guildBanRemove(GatewayEventData); #warning("Incomplete")
    case guildEmojisUpdate(GatewayEventData); #warning("Incomplete")
    case guildStickersUpdate(GatewayEventData); #warning("Incomplete")
    case guildIntegrationsUpdate(GatewayEventData); #warning("Incomplete")
    case guildMemberAdd(GatewayEventData); #warning("Incomplete")
    case guildMemberRemove(GatewayEventData); #warning("Incomplete")
    case guildMemberUpdate(GatewayEventData); #warning("Incomplete")
    case guildMembersChunk(GatewayEventData); #warning("Incomplete")
    case guildRoleCreate(GatewayEventData); #warning("Incomplete")
    case guildRoleUpdate(GatewayEventData); #warning("Incomplete")
    case guildRoleDelete(GatewayEventData); #warning("Incomplete")
    case guildScheduledEventCreate(ScheduledEvent) // untested
    case guildScheduledEventUpdate(ScheduledEvent) // untested
    case guildScheduledEventDelete(ScheduledEvent) // untested
    case guildScheduledEventUserAdd(GatewayEventData); #warning("Incomplete")
    case guildScheduledEventUserRemove(GatewayEventData); #warning("Incomplete")
    case guildAuditLogEntryCreate(GatewayEventData); #warning("Incomplete")
    case integrationCreate(GatewayEventData); #warning("Incomplete")
    case integrationUpdate(GatewayEventData); #warning("Incomplete")
    case integrationDelete(GatewayEventData); #warning("Incomplete")
    case interactionCreate(GatewayEventData); #warning("Incomplete")
    case inviteCreate(GatewayEventData); #warning("Incomplete")
    case inviteDelete(GatewayEventData); #warning("Incomplete")
    case messageCreate(GatewayEventData); #warning("Incomplete")
    case messageUpdate(GatewayEventData); #warning("Incomplete")
    case messageDelete(GatewayEventData); #warning("Incomplete")
    case messageDeleteBulk(GatewayEventData); #warning("Incomplete")
    case messageReactionAdd(GatewayEventData); #warning("Incomplete")
    case messageReactionRemove(GatewayEventData); #warning("Incomplete")
    case messageReactionRemoveAll(GatewayEventData); #warning("Incomplete")
    case messageReactionRemoveEmoji(GatewayEventData); #warning("Incomplete")
    case presenceUpdate(GatewayEventData); #warning("Incomplete")
    case stageInstanceCreate(StageInstance)
    case stageInstanceDelete(StageInstance)
    case stageInstanceUpdate(StageInstance)
    case typingStart(GatewayEventData); #warning("Incomplete")
    case userUpdate(GatewayEventData); #warning("Incomplete")
    case voiceStateUpdate(GatewayEventData); #warning("Incomplete")
    case voiceServerUpdate(GatewayEventData); #warning("Incomplete")
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
