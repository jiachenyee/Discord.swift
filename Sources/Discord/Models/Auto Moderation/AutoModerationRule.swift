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
