//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuild: GatewayEventData {
    /// guild id
    public var id: Snowflake
    /// guild name (2-100 characters, excluding trailing and leading whitespace)
    public var name: String
    /// icon hash
    public var icon: String?
    /// icon hash, returned when in the template object
    public var iconHash: String?
    /// splash hash
    public var splash: String?
    /// discovery splash hash; only present for guilds with the "DISCOVERABLE" feature
    public var discoverySplash: String?
    /// true if the user is the owner of the guild
    public var owner: Bool?
    /// id of owner
    public var ownerId: Snowflake?
    /// total permissions for the user in the guild (excludes overwrites)
    public var permissions: String?
    /// id of afk channel
    public var afkChannelId: Snowflake?
    /// afk timeout in seconds, can be set to: 60, 300, 900, 1800, 3600
    public var afkTimeout: AFKTimeout?
    /// true if the server widget is enabled
    public var widgetEnabled: Bool?
    /// the channel id that the widget will generate an invite to, or null if set to no invite
    public var widgetChannelId: Snowflake?
    /// verification level required for the guild
    public var verificationLevel: VerificationLevel
    /// default message notifications level
    public var defaultMessageNotifications: DefaultMessageNotificationLevel?
    /// explicit content filter level
    public var explicitContentFilter: ExplicitContentFilterLevel?
    /// roles in the guild
    public var roles: [Role]?
    /// custom guild emojis
    public var emojis: [Emoji]?
    /// enabled guild features
    public var features: [GuildFeature]
    /// required MFA level for the guild
    public var mfaLevel: MFALevel?
    /// application id of the guild creator if it is bot-created
    public var applicationId: Snowflake?
    /// the id of the channel where guild notices such as welcome messages and boost events are posted
    public var systemChannelId: Snowflake?
    /// system channel flags
    public var systemChannelFlags: SystemChannelFlags?
    /// the id of the channel where Community guilds can display rules and/or guidelines
    public var rulesChannelId: Snowflake?
    /// the maximum number of presences for the guild (null is always returned, apart from the largest of guilds)
    public var maxPresences: Int?
    /// the maximum number of members for the guild
    public var maxMembers: Int?
    /// the vanity url code for the guild
    public var vanityURLCode: String?
    /// the description of a guild
    public var description: String?
    /// banner hash
    public var banner: String?
    /// premium tier (Server Boost level)
    public var premiumTier: PremiumTier?
    /// the number of boosts this guild currently has
    public var premiumSubscriptionCount: Int?
    /// the preferred locale of a Community guild; used in server discovery and notices from Discord, and sent in interactions; defaults to "en-US"
    public var preferredLocale: DiscordLocale?
    /// the id of the channel where admins and moderators of Community guilds receive notices from Discord
    public var publicUpdatesChannelId: Snowflake?
    /// the maximum amount of users in a video channel
    public var maxVideoChannelUsers: Int?
    /// approximate number of members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true
    public var approximateMemberCount: Int?
    /// approximate number of non-offline members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true
    public var approximatePresenceCount: Int?
    /// the welcome screen of a Community guild, shown to new members, returned in an Invite's guild object
    public var welcomeScreen: WelcomeScreen?
    /// guild NSFW level
    public var nsfwLevel: GuildNSFWLevel
    /// custom guild stickers
    public var stickers: [Sticker]?
    /// whether the guild has the boost progress bar enabled
    public var premiumProgressBarEnabled: Bool
    
    /// When this guild was joined at
    public var joinedAt: ISO8601Timestamp

    /// true if this is considered a large guild
    public var large: Bool

    /// true if this guild is unavailable due to an outage
    public var unavailable: Bool?

    /// Total number of members in this guild
    public var memberCount: Int

    /// States of members currently in voice channels; lacks the `guild_id` key
    public var voiceStates: [VoiceState]

    /// Users in the guild
    public var members: [GuildMember]

    /// Channels in the guild
    public var channels: [Channel]

    /// All active threads in the guild that current user has permission to view
    public var threads: [Channel]

    /// Presences of the members in the guild, will only include non-offline members if the size is greater than large threshold
    public var presences: [Presence]

    /// Stage instances in the guild
    public var stageInstances: [StageInstance]

    /// Scheduled events in the guild
    public var guildScheduledEvents: [ScheduledEvent]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case icon = "icon"
        case iconHash = "icon_hash"
        case splash = "splash"
        case discoverySplash = "discovery_splash"
        case owner = "owner"
        case ownerId = "owner_id"
        case permissions = "permissions"
        case afkChannelId = "afk_channel_id"
        case afkTimeout = "afk_timeout"
        case widgetEnabled = "widget_enabled"
        case widgetChannelId = "widget_channel_id"
        case verificationLevel = "verification_level"
        case defaultMessageNotifications = "default_message_notifications"
        case explicitContentFilter = "explicit_content_filter"
        case roles = "roles"
        case emojis = "emojis"
        case features = "features"
        case mfaLevel = "mfa_level"
        case applicationId = "application_id"
        case systemChannelId = "system_channel_id"
        case systemChannelFlags = "system_channel_flags"
        case rulesChannelId = "rules_channel_id"
        case maxPresences = "max_presences"
        case maxMembers = "max_members"
        case vanityURLCode = "vanity_url_code"
        case description = "description"
        case banner = "banner"
        case premiumTier = "premium_tier"
        case premiumSubscriptionCount = "premium_subscription_count"
        case preferredLocale = "preferred_locale"
        case publicUpdatesChannelId = "public_updates_channel_id"
        case maxVideoChannelUsers = "max_video_channel_users"
        case approximateMemberCount = "approximate_member_count"
        case approximatePresenceCount = "approximate_presence_count"
        case welcomeScreen = "welcome_screen"
        case nsfwLevel = "nsfw_level"
        case stickers = "stickers"
        case premiumProgressBarEnabled = "premium_progress_bar_enabled"
        case joinedAt = "joined_at"
        case large = "large"
        case unavailable = "unavailable"
        case memberCount = "member_count"
        case voiceStates = "voice_states"
        case members = "members"
        case channels = "channels"
        case threads = "threads"
        case presences = "presences"
        case stageInstances = "stage_instances"
        case guildScheduledEvents = "guild_scheduled_events"
    }
}
