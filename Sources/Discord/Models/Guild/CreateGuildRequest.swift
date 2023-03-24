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
    public var verification_level: VerificationLevel?
    
    /// default message notification level
    public var default_message_notifications: DefaultMessageNotificationLevel?
    
    /// explicit content filter level
    public var explicit_content_filter: ExplicitContentFilterLevel?
    
#warning("role missing")
//    public var roles?    array of role objects    new guild roles
    
    /// new guild's channels
    public var channels: [PartialChannel]
    
    /// id for afk channel
    public var afk_channel_id: Snowflake?
    
    /// afk timeout in seconds, can be set to: 60, 300, 900, 1800, 3600
    public var afk_timeout: AFKTimeout?
    
    /// the id of the channel where guild notices such as welcome messages and boost events are posted
    public var system_channel_id: Snowflake?
    
    /// system channel flags
    public var system_channel_flags: SystemChannelFlags?
    
    public init(name: String, icon: Date? = nil, verification_level: VerificationLevel? = nil, default_message_notifications: DefaultMessageNotificationLevel? = nil, explicit_content_filter: ExplicitContentFilterLevel? = nil, channels: [PartialChannel], afk_channel_id: Snowflake? = nil, afk_timeout: AFKTimeout? = nil, system_channel_id: Snowflake? = nil, system_channel_flags: SystemChannelFlags? = nil) {
        self.name = name
        self.icon = icon
        self.verification_level = verification_level
        self.default_message_notifications = default_message_notifications
        self.explicit_content_filter = explicit_content_filter
        self.channels = channels
        self.afk_channel_id = afk_channel_id
        self.afk_timeout = afk_timeout
        self.system_channel_id = system_channel_id
        self.system_channel_flags = system_channel_flags
    }
}
