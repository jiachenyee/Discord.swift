//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct AutoModerationActionExecution: GatewayEventData {
    /// ID of the guild in which action was executed
    public var guildId: Snowflake
    
    /// Action which was executed
    public var action: AutoModerationAction
    
    /// ID of the rule which action belongs to
    public var ruleId: Snowflake
    
    /// Trigger type of rule which was triggered
    public var ruleTriggerType: TriggerType
    
    /// ID of the user which generated the content which triggered the rule
    public var userId: Snowflake
    
    /// ID of the channel in which user content was posted
    public var channelId: Snowflake?
    
    /// ID of any user message which content belongs to *
    public var messageId: Snowflake?
    
    /// ID of any system auto moderation messages posted as a result of this action **
    public var alertSystemMessageId: Snowflake?
    
    /// User-generated text content
    public var content: String
    
    /// Word or phrase configured in the rule that triggered the rule
    public var matchedKeyword: String?
    
    /// Substring in content that triggered the rule
    public var matchedContent: String?
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case action = "action"
        case ruleId = "rule_id"
        case ruleTriggerType = "rule_trigger_type"
        case userId = "user_id"
        case channelId = "channel_id"
        case messageId = "message_id"
        case alertSystemMessageId = "alert_system_message_id"
        case content = "content"
        case matchedKeyword = "matched_keyword"
        case matchedContent = "matched_content"
    }
}
