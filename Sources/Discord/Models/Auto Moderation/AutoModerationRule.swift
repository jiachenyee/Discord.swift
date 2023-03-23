//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AutoModerationRule: Codable {
    /// the id of this rule
    public var id: Snowflake
    
    /// the id of the guild which this rule belongs to
    public var guildId: Snowflake
    
    /// the rule name
    public var name: String
    
    /// the user which first created this rule
    public var creatorId: Snowflake
    
    /// the rule event type
    public var eventType: Int
    
    /// the rule trigger type
    public var triggerType: TriggerType
    
    /// the rule trigger metadata
    public var triggerMetadata: TriggerMetadata
    
    /// the actions which will execute when the rule is triggered
    public var actions: [AutoModerationAction]
    
    /// whether the rule is enabled
    public var enabled: Bool
    
    /// the role ids that should not be affected by the rule (Maximum of 20)
    public var exemptRoles: [Snowflake]
    
    /// the channel ids that should not be affected by the rule (Maximum of 50)
    public var exemptChannels: [Snowflake]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case guildId = "guild_id"
        case name = "name"
        case creatorId = "creator_id"
        case eventType = "event_type"
        case triggerType = "trigger_type"
        case triggerMetadata = "trigger_metadata"
        case actions = "actions"
        case enabled = "enabled"
        case exemptRoles = "exempt_roles"
        case exemptChannels = "exempt_channels"
    }
}

public enum TriggerType: Int, Codable {
    /// check if content contains words from a user defined list of keywords
    case keyword = 1
    /// check if content represents generic spam
    case spam = 3
    /// check if content contains words from internal pre-defined wordsets
    case keywordPreset = 4
    /// check if content contains more unique mentions than allowed
    case mentionSpam = 5
}

public struct TriggerMetadata: Codable {
    /// substrings which will be searched for in content (Maximum of 1000)
    public var keywordFilter: [String]?
    
    /// regular expression patterns which will be matched against content (Maximum of 10)
    public var regexPatterns: [String]?
    
    /// the internally pre-defined wordsets which will be searched for in content
    public var presets: [KeywordPresetType]?
    
    /// substrings which should not trigger the rule (Maximum of 100 or 1000)
    public var allowList: [String]?
    
    /// total number of unique role and user mentions allowed per message (Maximum of 50)
    public var mentionTotalLimit: Int?
    
    enum CodingKeys: String, CodingKey {
        case keywordFilter = "keyword_filter"
        case regexPatterns = "regex_patterns"
        case presets = "presets"
        case allowList = "allow_list"
        case mentionTotalLimit = "mention_total_limit"
    }
    
    init(keywordFilter: [String]? = nil, regexPatterns: [String]? = nil, presets: [KeywordPresetType]? = nil, allowList: [String]? = nil, mentionTotalLimit: Int? = nil) {
        self.keywordFilter = keywordFilter
        self.regexPatterns = regexPatterns
        self.presets = presets
        self.allowList = allowList
        self.mentionTotalLimit = mentionTotalLimit
    }
    
    public static func keyword(keywordFilter: [String],
                               regexPatterns: [String],
                               allowList: [String]) -> Self {
        .init(keywordFilter: keywordFilter, regexPatterns: regexPatterns, allowList: allowList)
    }
    
    public static func keywordPreset(presets: [KeywordPresetType],
                                     allowList: [String]) -> Self {
        .init(presets: presets, allowList: allowList)
    }
    
    public static func mentionSpam(mentionTotalLimit: Int) -> Self {
        .init(mentionTotalLimit: mentionTotalLimit)
    }
    
    public static func spam() -> Self {
        .init()
    }
}

public enum KeywordPresetType: Int, Codable {
    /// words that may be considered forms of swearing or cursing
    case profanity = 1
    /// words that refer to sexually explicit behavior or activity
    case sexualContent = 2
    /// personal insults or words that may be considered hate speech
    case slurs = 3
}

public struct AutoModerationAction: Codable {
    /// the type of action
    public var type: AutoModerationActionType
    
    /// additional metadata needed during execution for this specific action type
    public var metadata: AutoModerationActionMetadata?
    
    public static func blockMessage(customMessage: String? = nil) -> Self {
        AutoModerationAction(type: .blockMessage,
                             metadata: .init(customMessage: customMessage))
    }
    
    public static func sendAlertMessage(channel: Snowflake) -> Self {
        AutoModerationAction(type: .sendAlertMessage,
                             metadata: .init(channelId: channel))
    }
    
    public static func timeout(durationSeconds: Int) -> Self {
        AutoModerationAction(type: .timeout,
                             metadata: .init(durationSeconds: durationSeconds))
    }
}

public enum AutoModerationActionType: Int, Codable {
    /// blocks a member's message and prevents it from being posted. A custom explanation can be specified and shown to members whenever their message is blocked.
    case blockMessage = 1
    
    /// logs user content to a specified channel
    case sendAlertMessage = 2
    
    /// timeout user for a specified duration *
    case timeout = 3
}

public struct AutoModerationActionMetadata: Codable {
    /// channel to which user content should be logged
    public var channelId: Snowflake?
    
    /// timeout duration in seconds
    public var durationSeconds: Int?
    
    /// additional explanation that will be shown to members whenever their message is blocked    maximum of 150 characters
    public var customMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case durationSeconds = "duration_seconds"
        case customMessage = "custom_message"
    }
    
    init(channelId: Snowflake? = nil, durationSeconds: Int? = nil, customMessage: String? = nil) {
        self.channelId = channelId
        self.durationSeconds = durationSeconds
        self.customMessage = customMessage
    }
}

public struct AutoModerationRuleRequest: Codable {
    /// the rule name
    var name: String
    
    /// the event type
    var eventType: AutoModerationEventType = .messageSend
    
    /// the trigger type
    var triggerType: TriggerType
    
    /// the trigger metadata
    var triggerMetadata: TriggerMetadata?
    
    /// the actions which will execute when the rule is triggered
    var actions: [AutoModerationAction]
    
    /// whether the rule is enabled (False by default)
    var enabled: Bool? = false
    
    /// the role ids that should not be affected by the rule (Maximum of 20)
    var exemptRoles: [Snowflake]?
    
    /// the channel ids that should not be affected by the rule (Maximum of 50)
    var exemptChannels: [Snowflake]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case eventType = "event_type"
        case triggerType = "trigger_type"
        case triggerMetadata = "trigger_metadata"
        case actions = "actions"
        case enabled = "enabled"
        case exemptRoles = "exempt_roles"
        case exemptChannels = "exempt_channels"
    }
    
    public init(name: String,
                eventType: AutoModerationEventType = .messageSend,
                triggerType: TriggerType,
                triggerMetadata: TriggerMetadata? = nil,
                actions: [AutoModerationAction],
                enabled: Bool? = nil,
                exemptRoles: [Snowflake]? = nil,
                exemptChannels: [Snowflake]? = nil) {
        self.name = name
        self.eventType = eventType
        self.triggerType = triggerType
        self.triggerMetadata = triggerMetadata
        self.actions = actions
        self.enabled = enabled
        self.exemptRoles = exemptRoles
        self.exemptChannels = exemptChannels
    }
}

public enum AutoModerationEventType: Int, Codable {
    /// when a member sends or edits a message in the guild
    case messageSend = 1
}
