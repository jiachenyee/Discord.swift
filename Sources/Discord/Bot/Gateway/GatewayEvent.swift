//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public enum GatewayEvent {
    
    case ready(GatewayReady)
    case resumed(GatewayEventData)
    case applicationCommandPermissionsUpdate(GatewayEventData)
    case autoModerationRuleCreate(GatewayEventData)
    case autoModerationRuleUpdate(GatewayEventData)
    case autoModerationRuleDelete(GatewayEventData)
    case autoModerationActionExecution(GatewayEventData)
    case channelCreate(GatewayEventData)
    case channelUpdate(GatewayEventData)
    case channelDelete(GatewayEventData)
    case channelPinsUpdate(GatewayEventData)
    case threadCreate(GatewayEventData)
    case threadUpdate(GatewayEventData)
    case threadDelete(GatewayEventData)
    case threadListSync(GatewayEventData)
    case threadMemberUpdate(GatewayEventData)
    case threadMembersUpdate(GatewayEventData)
    case guildCreate(GatewayEventData)
    case guildUpdate(GatewayEventData)
    case guildDelete(GatewayEventData)
    case guildBanAdd(GatewayEventData)
    case guildBanRemove(GatewayEventData)
    case guildEmojisUpdate(GatewayEventData)
    case guildStickersUpdate(GatewayEventData)
    case guildIntegrationsUpdate(GatewayEventData)
    case guildMemberAdd(GatewayEventData)
    case guildMemberRemove(GatewayEventData)
    case guildMemberUpdate(GatewayEventData)
    case guildMembersChunk(GatewayEventData)
    case guildRoleCreate(GatewayEventData)
    case guildRoleUpdate(GatewayEventData)
    case guildRoleDelete(GatewayEventData)
    case guildScheduledEventCreate(GatewayEventData)
    case guildScheduledEventUpdate(GatewayEventData)
    case guildScheduledEventDelete(GatewayEventData)
    case guildScheduledEventUserAdd(GatewayEventData)
    case guildScheduledEventUserRemove(GatewayEventData)
    case guildAuditLogEntryCreate(GatewayEventData)
    case integrationCreate(GatewayEventData)
    case integrationUpdate(GatewayEventData)
    case integrationDelete(GatewayEventData)
    case interactionCreate(GatewayEventData)
    case inviteCreate(GatewayEventData)
    case inviteDelete(GatewayEventData)
    case messageCreate(GatewayEventData)
    case messageUpdate(GatewayEventData)
    case messageDelete(GatewayEventData)
    case messageDeleteBulk(GatewayEventData)
    case messageReactionAdd(GatewayEventData)
    case messageReactionRemove(GatewayEventData)
    case messageReactionRemoveAll(GatewayEventData)
    case messageReactionRemoveEmoji(GatewayEventData)
    case presenceUpdate(GatewayEventData)
    case stageInstanceCreate(GatewayEventData)
    case stageInstanceDelete(GatewayEventData)
    case stageInstanceUpdate(GatewayEventData)
    case typingStart(GatewayEventData)
    case userUpdate(GatewayEventData)
    case voiceStateUpdate(GatewayEventData)
    case voiceServerUpdate(GatewayEventData)
    case webhooksUpdate(GatewayEventData)
    
    public init?(jsonObject: [String: Any]) {
        guard let typeCode = jsonObject["t"] as? String,
              let data = jsonObject["d"] else {
            print("Unrecognised Event:", jsonObject["t"] ?? "")
            return nil
        }
        
        switch typeCode {
        case "READY": self = .ready(.decode(data))
//        case "RESUMED": return .resumed(.decode(data))
//        case "APPLICATION_COMMAND_PERMISSIONS_UPDATE": return .applicationCommandPermissionsUpdate(.decode(data))
//        case "AUTO_MODERATION_RULE_CREATE": return .autoModerationRuleCreate(.decode(data))
//        case "AUTO_MODERATION_RULE_UPDATE": return .autoModerationRuleUpdate(.decode(data))
//        case "AUTO_MODERATION_RULE_DELETE": return .autoModerationRuleDelete(.decode(data))
//        case "AUTO_MODERATION_ACTION_EXECUTION": return .autoModerationActionExecution(.decode(data))
//        case "CHANNEL_CREATE": return .channelCreate(.decode(data))
//        case "CHANNEL_UPDATE": return .channelUpdate(.decode(data))
//        case "CHANNEL_DELETE": return .channelDelete(.decode(data))
//        case "CHANNEL_PINS_UPDATE": return .channelPinsUpdate(.decode(data))
//        case "THREAD_CREATE": return .threadCreate(.decode(data))
//        case "THREAD_UPDATE": return .threadUpdate(.decode(data))
//        case "THREAD_DELETE": return .threadDelete(.decode(data))
//        case "THREAD_LIST_SYNC": return .threadListSync(.decode(data))
//        case "THREAD_MEMBER_UPDATE": return .threadMemberUpdate(.decode(data))
//        case "THREAD_MEMBERS_UPDATE": return .threadMembersUpdate(.decode(data))
//        case "GUILD_CREATE": return .guildCreate(.decode(data))
//        case "GUILD_UPDATE": return .guildUpdate(.decode(data))
//        case "GUILD_DELETE": return .guildDelete(.decode(data))
//        case "GUILD_BAN_ADD": return .guildBanAdd(.decode(data))
//        case "GUILD_BAN_REMOVE": return .guildBanRemove(.decode(data))
//        case "GUILD_EMOJIS_UPDATE": return .guildEmojisUpdate(.decode(data))
//        case "GUILD_STICKERS_UPDATE": return .guildStickersUpdate(.decode(data))
//        case "GUILD_INTEGRATIONS_UPDATE": return .guildIntegrationsUpdate(.decode(data))
//        case "GUILD_MEMBER_ADD": return .guildMemberAdd(.decode(data))
//        case "GUILD_MEMBER_REMOVE": return .guildMemberRemove(.decode(data))
//        case "GUILD_MEMBER_UPDATE": return .guildMemberUpdate(.decode(data))
//        case "GUILD_MEMBERS_CHUNK": return .guildMembersChunk(.decode(data))
//        case "GUILD_ROLE_CREATE": return .guildRoleCreate(.decode(data))
//        case "GUILD_ROLE_UPDATE": return .guildRoleUpdate(.decode(data))
//        case "GUILD_ROLE_DELETE": return .guildRoleDelete(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_CREATE": return .guildScheduledEventCreate(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_UPDATE": return .guildScheduledEventUpdate(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_DELETE": return .guildScheduledEventDelete(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_USER_ADD": return .guildScheduledEventUserAdd(.decode(data))
//        case "GUILD_SCHEDULED_EVENT_USER_REMOVE": return .guildScheduledEventUserRemove(.decode(data))
//        case "GUILD_AUDIT_LOG_ENTRY_CREATE": return .guildAuditLogEntryCreate(.decode(data))
//        case "INTEGRATION_CREATE": return .integrationCreate(.decode(data))
//        case "INTEGRATION_UPDATE": return .integrationUpdate(.decode(data))
//        case "INTEGRATION_DELETE": return .integrationDelete(.decode(data))
//        case "INTERACTION_CREATE": return .interactionCreate(.decode(data))
//        case "INVITE_CREATE": return .inviteCreate(.decode(data))
//        case "INVITE_DELETE": return .inviteDelete(.decode(data))
//        case "MESSAGE_CREATE": return .messageCreate(.decode(data))
//        case "MESSAGE_UPDATE": return .messageUpdate(.decode(data))
//        case "MESSAGE_DELETE": return .messageDelete(.decode(data))
//        case "MESSAGE_DELETE_BULK": return .messageDeleteBulk(.decode(data))
//        case "MESSAGE_REACTION_ADD": return .messageReactionAdd(.decode(data))
//        case "MESSAGE_REACTION_REMOVE": return .messageReactionRemove(.decode(data))
//        case "MESSAGE_REACTION_REMOVE_ALL": return .messageReactionRemoveAll(.decode(data))
//        case "MESSAGE_REACTION_REMOVE_EMOJI": return .messageReactionRemoveEmoji(.decode(data))
//        case "PRESENCE_UPDATE": return .presenceUpdate(.decode(data))
//        case "STAGE_INSTANCE_CREATE": return .stageInstanceCreate(.decode(data))
//        case "STAGE_INSTANCE_DELETE": return .stageInstanceDelete(.decode(data))
//        case "STAGE_INSTANCE_UPDATE": return .stageInstanceUpdate(.decode(data))
//        case "TYPING_START": return .typingStart(.decode(data))
//        case "USER_UPDATE": return .userUpdate(.decode(data))
//        case "VOICE_STATE_UPDATE": return .voiceStateUpdate(.decode(data))
//        case "VOICE_SERVER_UPDATE": return .voiceServerUpdate(.decode(data))
//        case "WEBHOOKS_UPDATE": return .webhooksUpdate(.decode(data))
        default:
            print("Unrecognised case")
        }
        
        return nil
    }
}

public protocol GatewayEventData: Codable {
    static func decode(_ data: Any) -> Self
}

public extension GatewayEventData {
    static func decode(_ data: Any) -> Self {
        let decoder = JSONDecoder()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data),
              let value = try? decoder.decode(Self.self, from: jsonData) else { fatalError("Could not decode/encode") }

        return value
    }
}
