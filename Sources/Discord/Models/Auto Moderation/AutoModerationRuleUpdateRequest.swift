//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AutoModerationRuleUpdateRequest: Codable {
    /// the rule name
    public var name: String?
    
    /// the event type
    public var eventType: AutoModerationEventType?
    
    /// the trigger metadata
    public var triggerMetadata: TriggerMetadata?
    
    /// the actions which will execute when the rule is triggered
    public var actions: [AutoModerationAction]?
    
    /// whether the rule is enabled (False by default)
    public var enabled: Bool?
    
    /// the role ids that should not be affected by the rule (Maximum of 20)
    public var exemptRoles: [Snowflake]?
    
    /// the channel ids that should not be affected by the rule (Maximum of 50)
    public var exemptChannels: [Snowflake]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case eventType = "event_type"
        case triggerMetadata = "trigger_metadata"
        case actions = "actions"
        case enabled = "enabled"
        case exemptRoles = "exempt_roles"
        case exemptChannels = "exempt_channels"
    }
    
    public init(name: String? = nil,
                eventType: AutoModerationEventType? = nil,
                triggerMetadata: TriggerMetadata? = nil,
                actions: [AutoModerationAction]? = nil,
                enabled: Bool? = nil,
                exemptRoles: [Snowflake]? = nil,
                exemptChannels: [Snowflake]? = nil) {
        self.name = name
        self.eventType = eventType
        self.triggerMetadata = triggerMetadata
        self.actions = actions
        self.enabled = enabled
        self.exemptRoles = exemptRoles
        self.exemptChannels = exemptChannels
    }
}
