//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AutoModerationRuleRequest: Codable {
    /// the rule name
    public var name: String
    
    /// the event type
    public var eventType: AutoModerationEventType = .messageSend
    
    /// the trigger type
    public var triggerType: TriggerType
    
    /// the trigger metadata
    public var triggerMetadata: TriggerMetadata?
    
    /// the actions which will execute when the rule is triggered
    public var actions: [AutoModerationAction]
    
    /// whether the rule is enabled (False by default)
    public var enabled: Bool? = false
    
    /// the role ids that should not be affected by the rule (Maximum of 20)
    public var exemptRoles: [Snowflake]?
    
    /// the channel ids that should not be affected by the rule (Maximum of 50)
    public var exemptChannels: [Snowflake]?
    
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
                trigger: AutoModerationTrigger,
                actions: [AutoModerationAction],
                enabled: Bool? = nil,
                exemptRoles: [Snowflake]? = nil,
                exemptChannels: [Snowflake]? = nil) {
        self.name = name
        self.eventType = eventType
        self.triggerType = trigger.triggerType
        self.triggerMetadata = trigger.triggerMetadata
        self.actions = actions
        self.enabled = enabled
        self.exemptRoles = exemptRoles
        self.exemptChannels = exemptChannels
    }
}
