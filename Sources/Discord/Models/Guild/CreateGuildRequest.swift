//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct CreateGuildRequest: Codable {
    /// name of the guild (2-100 characters)
    public var name: String
    
    /// base64 128x128 image for the guild icon
    public var icon: Date?
    
    /// verification level
    public var verificationLevel: VerificationLevel?
    
    /// default message notification level
    public var defaultMessageNotifications: DefaultMessageNotificationLevel?
    
    /// explicit content filter level
    public var explicitContentFilter: ExplicitContentFilterLevel?
    
    /// new guild roles
    public var roles: [Role]?
    
    /// new guild's channels
    public var channels: [PartialChannel]
    
    /// id for afk channel
    public var afkChannelId: Snowflake?
    
    /// afk timeout in seconds, can be set to: 60, 300, 900, 1800, 3600
    public var afkTimeout: AFKTimeout?
    
    /// the id of the channel where guild notices such as welcome messages and boost events are posted
    public var systemChannelId: Snowflake?
    
    /// system channel flags
    public var systemChannelFlags: SystemChannelFlags?
    
    public init(name: String,
                icon: Date? = nil,
                verificationLevel: VerificationLevel? = nil,
                defaultMessageNotifications: DefaultMessageNotificationLevel? = nil,
                explicitContentFilter: ExplicitContentFilterLevel? = nil,
                roles: [Role]? = nil,
                channels: [PartialChannel],
                afkChannelId: Snowflake? = nil,
                afkTimeout: AFKTimeout? = nil,
                systemChannelId: Snowflake? = nil,
                systemChannelFlags: SystemChannelFlags? = nil) {
        self.name = name
        self.icon = icon
        self.verificationLevel = verificationLevel
        self.defaultMessageNotifications = defaultMessageNotifications
        self.explicitContentFilter = explicitContentFilter
        self.roles = roles
        self.channels = channels
        self.afkChannelId = afkChannelId
        self.afkTimeout = afkTimeout
        self.systemChannelId = systemChannelId
        self.systemChannelFlags = systemChannelFlags
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case icon = "icon"
        case verificationLevel = "verification_level"
        case defaultMessageNotifications = "default_message_notifications"
        case explicitContentFilter = "explicit_content_filter"
        case roles = "roles"
        case channels = "channels"
        case afkChannelId = "afk_channel_id"
        case afkTimeout = "afk_timeout"
        case systemChannelId = "system_channel_id"
        case systemChannelFlags = "system_channel_flags"
    }
}
