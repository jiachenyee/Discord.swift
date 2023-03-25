//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct PartialGuild: Codable {
    /// guild id
    public var id: Snowflake?
    /// guild name (2-100 characters, excluding trailing and leading whitespace)
    public var name: String?
    /// icon hash
    public var icon: String?
    /// icon hash, returned when in the template object
    public var icon_hash: String?
    /// splash hash
    public var splash: String?
    /// discovery splash hash; only present for guilds with the "DISCOVERABLE" feature
    public var discovery_splash: String?
    /// true if the user is the owner of the guild
    public var owner: Bool?
    /// id of owner
    public var owner_id: Snowflake?
    /// total permissions for the user in the guild (excludes overwrites)
    public var permissions: String?
    /// id of afk channel
    public var afk_channel_id: Snowflake?
    /// afk timeout in seconds, can be set to: 60, 300, 900, 1800, 3600
    public var afk_timeout: AFKTimeout?
    /// true if the server widget is enabled
    public var widget_enabled: Bool?
    /// the channel id that the widget will generate an invite to, or null if set to no invite
    public var widget_channel_id: Snowflake?
    /// verification level required for the guild
    public var verification_level: VerificationLevel
    /// default message notifications level
    public var default_message_notifications: DefaultMessageNotificationLevel?
    /// explicit content filter level
    public var explicit_content_filter: ExplicitContentFilterLevel?
    /// roles in the guild
    public var roles: [PartialRole]?
    /// custom guild emojis
    public var emojis: [Emoji]?
    /// enabled guild features
    public var features: [GuildFeature]
    /// required MFA level for the guild
    public var mfa_level: MFALevel?
    /// application id of the guild creator if it is bot-created
    public var application_id: Snowflake?
    /// the id of the channel where guild notices such as welcome messages and boost events are posted
    public var system_channel_id: Snowflake?
    /// system channel flags
    public var system_channel_flags: SystemChannelFlags?
    /// the id of the channel where Community guilds can display rules and/or guidelines
    public var rules_channel_id: Snowflake?
    /// the maximum number of presences for the guild (null is always returned, apart from the largest of guilds)
    public var max_presences: Int?
    /// the maximum number of members for the guild
    public var max_members: Int?
    /// the vanity url code for the guild
    public var vanity_url_code: String?
    /// the description of a guild
    public var description: String?
    /// banner hash
    public var banner: String?
    /// premium tier (Server Boost level)
    public var premium_tier: PremiumTier?
    /// the number of boosts this guild currently has
    public var premium_subscription_count: Int?
    /// the preferred locale of a Community guild; used in server discovery and notices from Discord, and sent in interactions; defaults to "en-US"
    public var preferred_locale: DiscordLocale?
    /// the id of the channel where admins and moderators of Community guilds receive notices from Discord
    public var public_updates_channel_id: Snowflake?
    /// the maximum amount of users in a video channel
    public var max_video_channel_users: Int?
    /// approximate number of members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true
    public var approximate_member_count: Int?
    /// approximate number of non-offline members in this guild, returned from the GET /guilds/<id> endpoint when with_counts is true
    public var approximate_presence_count: Int?
    /// the welcome screen of a Community guild, shown to new members, returned in an Invite's guild object
    public var welcome_screen: WelcomeScreen?
    /// guild NSFW level
    public var nsfw_level: GuildNSFWLevel
    /// custom guild stickers
    //    public var stickers?: array of sticker objects
#warning("sticker missing")
    /// whether the guild has the boost progress bar enabled
    public var premium_progress_bar_enabled: Bool
}
