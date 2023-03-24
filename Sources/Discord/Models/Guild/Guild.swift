//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct Guild: Codable {
    /// guild id
    public var id: Snowflake
    /// guild name (2-100 characters, excluding trailing and leading whitespace)
    public var name: String
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
    public var owner_id: Snowflake
    /// total permissions for the user in the guild (excludes overwrites)
    public var permissions: String?
    /// id of afk channel
    public var afk_channel_id: Snowflake?
    /// afk timeout in seconds, can be set to: 60, 300, 900, 1800, 3600
    public var afk_timeout: AFKTimeout
    /// true if the server widget is enabled
    public var widget_enabled: Bool?
    /// the channel id that the widget will generate an invite to, or null if set to no invite
    public var widget_channel_id: Snowflake?
    /// verification level required for the guild
    public var verification_level: VerificationLevel
    /// default message notifications level
    public var default_message_notifications: DefaultMessageNotificationLevel
    /// explicit content filter level
    public var explicit_content_filter: ExplicitContentFilterLevel
    /// roles in the guild
//    public var roles: array of role objects
    #warning("role missing")
    /// custom guild emojis
    public var emojis: [Emoji]
    /// enabled guild features
    public var features: [GuildFeature]
    /// required MFA level for the guild
    public var mfa_level: MFALevel
    /// application id of the guild creator if it is bot-created
    public var application_id: Snowflake?
    /// the id of the channel where guild notices such as welcome messages and boost events are posted
    public var system_channel_id: Snowflake?
    /// system channel flags
    public var system_channel_flags: SystemChannelFlags
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
    public var premium_tier: PremiumTier
    /// the number of boosts this guild currently has
    public var premium_subscription_count: Int?
    /// the preferred locale of a Community guild; used in server discovery and notices from Discord, and sent in interactions; defaults to "en-US"
    public var preferred_locale: String
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

public enum DefaultMessageNotificationLevel: Int, Codable {
    /// members will receive notifications for all messages by default
    case allMessages = 0
    
    /// members will receive notifications only for messages that @mention them by default
    case onlyMentions = 1
}

public enum ExplicitContentFilterLevel: Int, Codable {
    /// media content will not be scanned
    case disabled = 0
    /// media content sent by members without roles will be scanned
    case membersWithoutRoles = 1
    /// media content sent by all members will be scanned
    case allMembers = 2
}

public enum MFALevel: Int, Codable {
    /// guild has no MFA/2FA requirement for moderation actions
    case noMFA = 0
    /// guild has a 2FA requirement for moderation actions
    case elevated = 1
}

public enum VerificationLevel: Int, Codable {
    /// unrestricted
    case noVerification = 0
    /// must have verified email on account
    case low = 1
    /// must be registered on Discord for longer than 5 minutes
    case medium = 2
    /// must be a member of the server for longer than 10 minutes
    case high = 3
    /// must have a verified phone number
    case veryHigh = 4
}

public enum GuildNSFWLevel: Int, Codable {
    case `default` = 0
    case explicit = 1
    case safe = 2
    case ageRestricted = 3
}

public enum PremiumTier: Int, Codable {
    /// guild has not unlocked any Server Boost perks
    case none = 0
    /// guild has unlocked Server Boost level 1 perks
    case tier1 = 1
    /// guild has unlocked Server Boost level 2 perks
    case tier2 = 2
    /// guild has unlocked Server Boost level 3 perks
    case tier3 = 3
}

public struct SystemChannelFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// Suppress member join notifications
    public static let SUPPRESS_JOIN_NOTIFICATIONS = Self(rawValue: 1 << 0)
    
    /// Suppress server boost notifications
    public static let SUPPRESS_PREMIUM_SUBSCRIPTIONS = Self(rawValue: 1 << 1)
    
    /// Suppress server setup tips
    public static let SUPPRESS_GUILD_REMINDER_NOTIFICATIONS = Self(rawValue: 1 << 2)
    
    /// Hide member join sticker reply buttons
    public static let SUPPRESS_JOIN_NOTIFICATION_REPLIES = Self(rawValue: 1 << 3)
    
    /// Suppress role subscription purchase and renewal notifications
    public static let SUPPRESS_ROLE_SUBSCRIPTION_PURCHASE_NOTIFICATIONS = Self(rawValue: 1 << 4)
    
    /// Hide role subscription sticker reply buttons
    public static let SUPPRESS_ROLE_SUBSCRIPTION_PURCHASE_NOTIFICATION_REPLIES = Self(rawValue: 1 << 5)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}

public enum GuildFeature: String, Codable {
    /// guild has access to set an animated guild banner image
    case animatedBanner = "ANIMATED_BANNER"
    
    /// guild has access to set an animated guild icon
    case animatedIcon = "ANIMATED_ICON"
    
    /// guild is using the old permissions configuration behavior
    case applicationCommandPermissionV2 = "APPLICATION_COMMAND_PERMISSIONS_V2"
    
    /// guild has set up auto moderation rules
    case autoModeration = "AUTO_MODERATION"
    
    /// guild has access to set a guild banner image
    case banner = "BANNER"
    
    /// guild can enable welcome screen, Membership Screening, stage channels and discovery, and receives community updates
    case community = "COMMUNITY"
    
    /// guild has enabled monetization
    case creatorMonetizableProvisional = "CREATOR_MONETIZABLE_PROVISIONAL"
    
    /// guild has enabled the role subscription promo page
    case creatorStorePage = "CREATOR_STORE_PAGE"
    
    /// guild has been set as a support server on the App Directory
    case developerSupportServer = "DEVELOPER_SUPPORT_SERVER"
    
    /// guild is able to be discovered in the directory
    case discoverable = "DISCOVERABLE"
    
    /// guild is able to be featured in the directory
    case featurable = "FEATURABLE"
    
    /// guild has paused invites, preventing new users from joining
    case invitesDisabled = "INVITES_DISABLED"
    
    /// guild has access to set an invite splash background
    case inviteSplash = "INVITE_SPLASH"
    
    /// guild has enabled Membership Screening
    case memberVerificationGateEnabled = "MEMBER_VERIFICATION_GATE_ENABLED"
    
    /// guild has increased custom sticker slots
    case moreStickers = "MORE_STICKERS"
    
    /// guild has access to create announcement channels
    case news = "NEWS"
    
    /// guild is partnered
    case partnered = "PARTNERED"
    
    /// guild can be previewed before joining via Membership Screening or the directory
    case previewEnabled = "PREVIEW_ENABLED"
    
    /// guild is able to set role icons
    case roleIcons = "ROLE_ICONS"
    
    /// guild has role subscriptions that can be purchased
    case roleSubscriptionsAvailableForPurchase = "ROLE_SUBSCRIPTIONS_AVAILABLE_FOR_PURCHASE"
    
    /// guild has enabled role subscriptions
    case roleSubscriptionsEnabled = "ROLE_SUBSCRIPTIONS_ENABLED"
    
    /// guild has enabled ticketed events
    case ticketedEventsEnabled = "TICKETED_EVENTS_ENABLED"
    
    /// guild has access to set a vanity URL
    case vanityURL = "VANITY_URL"
    
    /// guild is verified
    case verified = "VERIFIED"
    
    /// guild has access to set 384kbps bitrate in voice (previously VIP voice servers)
    case vipRegions = "VIP_REGIONS"
    
    /// guild has enabled the welcome screen
    case welcomeScreenEnabled = "WELCOME_SCREEN_ENABLED"
}

public struct GuildPreview: Codable {
    /// guild id
    var id: Snowflake
    
    /// guild name (2-100 characters)
    var name: String
    
    /// icon hash
    var icon: String?
    
    /// splash hash
    var splash: String?
    
    /// discovery splash hash
    var discovery_splash: String?
    
    /// custom guild emojis
    var emojis: [Emoji]
    
    /// enabled guild features
    var features:  [GuildFeature]
    
    /// approximate number of members in this guild
    var approximate_member_count: Int
    
    /// approximate number of online members in this guild
    var approximate_presence_count: Int
    
    /// the description for the guild
    var description: String?
    
    /// custom guild stickers
//    var stickers:  array of sticker objects
#warning("sticker missing")
}

public struct GuildWidgetSettings: Codable {
    /// whether the widget is enabled
    public var enabled: Bool
    
    /// the widget channel id
    public var channelId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case channelId = "channel_id"
    }
}

public struct GuildWidget: Codable {
    /// guild id
    public var id: Snowflake
    
    /// guild name (2-100 characters)
    public var name: String
    
    /// instant invite for the guilds specified widget invite channel
    public var instantInvite: String?
    
    /// voice and stage channels which are accessible by @everyone
    public var channels: [Channel]
    
    /// special widget user objects that includes users presence (Limit 100)
    public var members: [User]
    
    /// number of online members in this guild
    public var presenceCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case instantInvite = "instant_invite"
        case channels = "channels"
        case members = "members"
        case presenceCount = "presence_count"
    }
}

public struct GuildMember: Codable {
    /// the user this guild member represents
    public var user: User?
    
    /// this user's guild nickname
    public var nick: String?
    
    /// the member's guild avatar hash
    public var avatar: String?
    
    /// array of role object ids
    public var roles: [Snowflake]
    
    /// when the user joined the guild
    public var joined_at: ISO8601Timestamp
    
    /// when the user started boosting the guild
    public var premium_since: ISO8601Timestamp?
    
    /// whether the user is deafened in voice channels
    public var deaf: Bool
    
    /// whether the user is muted in voice channels
    public var mute: Bool
    
    /// guild member flags represented as a bit set, defaults to 0
    public var flags: GuildMemberFlags
    
    /// whether the user has not yet passed the guild's Membership Screening requirements
    public var pending: Bool?
    
    /// total permissions of the member in the channel, including overwrites, returned when in the interaction object
    public var permissions: String
    
    /// when the user's timeout will expire and the user will be able to communicate in the guild again, null or a time in the past if the user is not timed out
    public var communication_disabled_until: ISO8601Timestamp?
}


public struct GuildMemberFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    ///Member has left and rejoined the guild    false
    public static let DID_REJOIN = Self(rawValue: 1 << 0)
    
    ///Member has completed onboarding    false
    public static let COMPLETED_ONBOARDING = Self(rawValue: 1 << 1)
    
    ///Member is exempt from guild verification requirements    true
    public static let BYPASSES_VERIFICATION = Self(rawValue: 1 << 2)
    
    ///Member has started onboarding    false
    public static let STARTED_ONBOARDING = Self(rawValue: 1 << 3)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}

public struct Integration: Codable {
    /// integration id
    public var id: Snowflake
    
    /// integration name
    public var name: String
    
    /// integration type (twitch, youtube, discord, or guild_subscription)
    public var type: String
    
    /// is this integration enabled
    public var enabled: Bool
    
    /// is this integration syncing
    public var syncing: Bool?
    
    /// id that this integration uses for "subscribers"
    public var role_id: Snowflake?
    
    /// whether emoticons should be synced for this integration (twitch only currently)
    public var enable_emoticons: Bool?
    
    /// the behavior of expiring subscribers
    public var expire_behavior: IntegrationExpireBehaviour?
    
    /// the grace period (in days) before expiring subscribers
    public var expire_grace_period: Int?
    
    /// user for this integration
    public var user: User?
    
    /// integration account information
    public var account: IntegrationAccount
    
    /// when this integration was last synced
    public var synced_at: ISO8601Timestamp?
    
    /// how many subscribers this integration has
    public var subscriber_count: Int?
    
    /// has this integration been revoked
    public var revoked: Bool?
    
    /// The bot/OAuth2 application for discord integrations
    public var application: IntegrationApplication?
    
    /// the scopes the application has been authorized for
//    public var scopes?    array of OAuth2 scopes
#warning("oauth2 scopes missing")
}

public enum IntegrationExpireBehaviour: Int, Codable {
    case removeRole = 0
    case kick = 1
}

public struct IntegrationAccount: Codable {
    /// id of the account
    public var id: String
    
    /// name of the account
    public var name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

public struct IntegrationApplication: Codable {
    /// the id of the app
    public var id: Snowflake
    
    /// the name of the app
    public var name: String
    
    /// the icon hash of the app
    public var icon: String?
    
    /// the description of the app
    public var description: String
    
    /// the bot associated with this application
    public var bot: User?
}

public struct Ban: Codable {
    /// the reason for the ban
    var reason: String?
    
    /// the banned user
    var user: User
}

public struct WelcomeScreen: Codable {
    /// the server description shown in the welcome screen
    var description: String?
    
    /// the channels shown in the welcome screen, up to 5
    var welcomeChannels: [WelcomeScreenChannel]
    
    enum CodingKeys: String, CodingKey {
        case description = "description"
        case welcomeChannels = "welcome_channels"
    }
}

public struct WelcomeScreenChannel: Codable {
    /// the channel's id
    var channelId: Snowflake
    
    /// the description shown for the channel
    var description: String
    
    /// the emoji id, if the emoji is custom
    var emojiId: Snowflake?
    
    /// the emoji name if custom, the unicode character if standard, or null if no emoji is set
    var emojiName: String?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case description = "description"
        case emojiId = "emoji_id"
        case emojiName = "emoji_name"
    }
}
