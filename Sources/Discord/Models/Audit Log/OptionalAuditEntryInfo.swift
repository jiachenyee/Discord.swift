//
//  OptionalAuditEntryInfo.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct OptionalAuditEntryInfo: Codable {
    /// ID of the app whose permissions were targeted    APPLICATION_COMMAND_PERMISSION_UPDATE
    public var applicationId: Snowflake?
    
    /// Name of the Auto Moderation rule that was triggered    AUTO_MODERATION_BLOCK_MESSAGE & AUTO_MODERATION_FLAG_TO_CHANNEL & AUTO_MODERATION_USER_COMMUNICATION_DISABLED
    public var autoModerationRuleName: String?
    
    /// Trigger type of the Auto Moderation rule that was triggered    AUTO_MODERATION_BLOCK_MESSAGE & AUTO_MODERATION_FLAG_TO_CHANNEL & AUTO_MODERATION_USER_COMMUNICATION_DISABLED
    public var autoModerationRuleTriggerType: String?
    
    /// Channel in which the entities were targeted    MEMBER_MOVE & MESSAGE_PIN & MESSAGE_UNPIN & MESSAGE_DELETE & STAGE_INSTANCE_CREATE & STAGE_INSTANCE_UPDATE & STAGE_INSTANCE_DELETE & AUTO_MODERATION_BLOCK_MESSAGE & AUTO_MODERATION_FLAG_TO_CHANNEL & AUTO_MODERATION_USER_COMMUNICATION_DISABLED
    public var channelId: Snowflake?
    
    /// Number of entities that were targeted    MESSAGE_DELETE & MESSAGE_BULK_DELETE & MEMBER_DISCONNECT & MEMBER_MOVE
    public var count: String?
    
    /// Number of days after which inactive members were kicked    MEMBER_PRUNE
    public var deleteMemberDays: String?
    
    /// ID of the overwritten entity    CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE & CHANNEL_OVERWRITE_DELETE
    public var id: Snowflake?
    
    /// Number of members removed by the prune    MEMBER_PRUNE
    public var membersRemoved: String?
    
    /// ID of the message that was targeted    MESSAGE_PIN & MESSAGE_UNPIN
    public var messageId: Snowflake?
    
    /// Name of the role if type is "0" (not present if type is "1")    CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE & CHANNEL_OVERWRITE_DELETE
    public var roleName: String?
    
    /// Type of overwritten entity - role ("0") or member ("1")    CHANNEL_OVERWRITE_CREATE & CHANNEL_OVERWRITE_UPDATE & CHANNEL_OVERWRITE_DELETE
    public var type: String?
    
    enum CodingKeys: String, CodingKey {
        case applicationId = "application_id"
        case autoModerationRuleName = "auto_moderation_rule_name"
        case autoModerationRuleTriggerType = "auto_moderation_rule_trigger_type"
        case channelId = "channel_id"
        case count = "count"
        case deleteMemberDays = "delete_member_days"
        case id = "id"
        case membersRemoved = "members_removed"
        case messageId = "message_id"
        case roleName = "role_name"
        case type = "type"
    }
}
