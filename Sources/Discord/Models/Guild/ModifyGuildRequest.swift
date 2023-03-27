//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ModifyGuildRequest: Codable {
    /// guild name
    public var name: String?
    
    /// verification level
    public var verificationLevel: Int?
    
    /// default message notification level
    public var defaultMessageNotifications: DefaultMessageNotificationLevel?
    
    /// explicit content filter level
    public var explicitContentFilter: ExplicitContentFilterLevel?
    
    /// id for afk channel
    public var afkChannelId: Snowflake?
    
    /// afk timeout in seconds, can be set to: 60, 300, 900, 1800, 3600
    public var afkTimeout: AFKTimeout?
    
    /// base64 1024x1024 png/jpeg/gif image for the guild icon (can be animated gif when the server has the ANIMATED_ICON feature)
    public var icon: Data?
    
    /// user id to transfer guild ownership to (must be owner)
    public var ownerId: Snowflake?
    
    /// base64 16:9 png/jpeg image for the guild splash (when the server has the INVITE_SPLASH feature)
    public var splash: Data?
    
    /// base64 16:9 png/jpeg image for the guild discovery splash (when the server has the DISCOVERABLE feature)
    public var discoverySplash: Data?
    
    /// base64 16:9 png/jpeg image for the guild banner (when the server has the BANNER feature; can be animated gif when the server has the ANIMATED_BANNER feature)
    public var banner: Data?
    
    /// the id of the channel where guild notices such as welcome messages and boost events are posted
    public var systemChannelId: Snowflake?
    
    /// system channel flags
    public var systemChannelFlags: SystemChannelFlags?
    
    /// the id of the channel where Community guilds display rules and/or guidelines
    public var rulesChannelId: Snowflake?
    
    /// the id of the channel where admins and moderators of Community guilds receive notices from Discord
    public var publicUpdatesChannelId: Snowflake?
    
    /// the preferred locale of a Community guild used in server discovery and notices from Discord; defaults to "en-US"
    public var preferredLocale: DiscordLocale?
    
    /// enabled guild features
    public var features: [GuildFeature]?
    
    /// the description for the guild
    public var description: String?
    
    /// whether the guild's boost progress bar should be enabled
    public var premiumProgressBarEnabled: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case verificationLevel = "verification_level"
        case defaultMessageNotifications = "default_message_notifications"
        case explicitContentFilter = "explicit_content_filter"
        case afkChannelId = "afk_channel_id"
        case afkTimeout = "afk_timeout"
        case icon = "icon"
        case ownerId = "owner_id"
        case splash = "splash"
        case discoverySplash = "discovery_splash"
        case banner = "banner"
        case systemChannelId = "system_channel_id"
        case systemChannelFlags = "system_channel_flags"
        case rulesChannelId = "rules_channel_id"
        case publicUpdatesChannelId = "public_updates_channel_id"
        case preferredLocale = "preferred_locale"
        case features = "features"
        case description = "description"
        case premiumProgressBarEnabled = "premium_progress_bar_enabled"
    }
    
    public init(name: String? = nil,
                verificationLevel: Int? = nil,
                defaultMessageNotifications: DefaultMessageNotificationLevel? = nil,
                explicitContentFilter: ExplicitContentFilterLevel? = nil,
                afkChannelId: Snowflake? = nil,
                afkTimeout: AFKTimeout? = nil,
                icon: Data? = nil,
                ownerId: Snowflake? = nil,
                splash: Data? = nil,
                discoverySplash: Data? = nil,
                banner: Data? = nil,
                systemChannelId: Snowflake? = nil,
                systemChannelFlags: SystemChannelFlags? = nil,
                rulesChannelId: Snowflake? = nil,
                publicUpdatesChannelId: Snowflake? = nil,
                preferredLocale: DiscordLocale? = nil,
                features: [GuildFeature]? = nil,
                description: String? = nil,
                premiumProgressBarEnabled: Bool? = nil) {
        self.name = name
        self.verificationLevel = verificationLevel
        self.defaultMessageNotifications = defaultMessageNotifications
        self.explicitContentFilter = explicitContentFilter
        self.afkChannelId = afkChannelId
        self.afkTimeout = afkTimeout
        self.icon = icon
        self.ownerId = ownerId
        self.splash = splash
        self.discoverySplash = discoverySplash
        self.banner = banner
        self.systemChannelId = systemChannelId
        self.systemChannelFlags = systemChannelFlags
        self.rulesChannelId = rulesChannelId
        self.publicUpdatesChannelId = publicUpdatesChannelId
        self.preferredLocale = preferredLocale
        self.features = features
        self.description = description
        self.premiumProgressBarEnabled = premiumProgressBarEnabled
    }
    
    public static func modifying(name: String? = nil,
                                 verificationLevel: Int? = nil,
                                 defaultMessageNotifications: DefaultMessageNotificationLevel? = nil,
                                 explicitContentFilter: ExplicitContentFilterLevel? = nil,
                                 afkChannelId: Snowflake? = nil,
                                 afkTimeout: AFKTimeout? = nil,
                                 icon: Data? = nil,
                                 ownerId: Snowflake? = nil,
                                 splash: Data? = nil,
                                 discoverySplash: Data? = nil,
                                 banner: Data? = nil,
                                 systemChannelId: Snowflake? = nil,
                                 systemChannelFlags: SystemChannelFlags? = nil,
                                 rulesChannelId: Snowflake? = nil,
                                 publicUpdatesChannelId: Snowflake? = nil,
                                 preferredLocale: DiscordLocale? = nil,
                                 features: [GuildFeature]? = nil,
                                 description: String? = nil,
                                 premiumProgressBarEnabled: Bool? = nil) -> Self {
        Self(name: name,
             verificationLevel: verificationLevel,
             defaultMessageNotifications: defaultMessageNotifications,
             explicitContentFilter: explicitContentFilter,
             afkChannelId: afkChannelId,
             afkTimeout: afkTimeout,
             icon: icon,
             ownerId: ownerId,
             splash: splash,
             discoverySplash: discoverySplash,
             banner: banner,
             systemChannelId: systemChannelId,
             systemChannelFlags: systemChannelFlags,
             rulesChannelId: rulesChannelId,
             publicUpdatesChannelId: publicUpdatesChannelId,
             preferredLocale: preferredLocale,
             features: features,
             description: description,
             premiumProgressBarEnabled: premiumProgressBarEnabled)
    }
}
