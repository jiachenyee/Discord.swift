//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum VideoQualityTag: Int, Codable {
    /// Discord chooses the quality for optimal performance
    case auto = 1
    
    /// 720p
    case full = 2
}

public struct ChannelFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// this thread is pinned to the top of its parent GUILD_FORUM channel
    public static let pinned = Self(rawValue: 1 << 1)
    
    /// whether a tag is required to be specified when creating a thread in a GUILD_FORUM channel. Tags are specified in the applied_tags field.
    public static let requireTag = Self(rawValue: 1 << 4)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}

public enum SortOrder: Int, Codable {
    /// Sort forum posts by activity
    case latestActivity = 0
    
    /// Sort forum posts by creation time (from most recent to oldest)
    case creationDate = 1
}

public enum ForumLayoutTypes: Int, Codable {
    /// No default has been set for forum channel
    case notSet = 0
    
    /// Display posts as a list
    case listView = 1
    
    /// Display posts as a collection of tiles
    case galleryView = 2
}

public struct Channel: Codable {
    /// the id of this channel
    public var id: Snowflake
    /// the type of channel
    public var type: ChannelType
    /// the id of the guild (may be missing for some channel objects received over gateway guild dispatches)
    public var guild_id: Snowflake
    /// sorting position of the channel
    public var position: Int?
    /// explicit permission overwrites for members and roles
    public var permission_overwrites: [Overwrite]?
    /// the name of the channel (1-100 characters)
    public var name: String?
    /// the channel topic (0-4096 characters for GUILD_FORUM channels, 0-1024 characters for all others)
    public var topic: String?
    /// whether the channel is nsfw
    public var nsfw: Bool?
    /// the id of the last message sent in this channel (or thread for GUILD_FORUM channels) (may not point to an existing or valid message or thread)
    public var last_message_id: Snowflake?
    /// the bitrate (in bits) of the voice channel
    public var bitrate: Int?
    /// the user limit of the voice channel
    public var user_limit: Int?
    /// amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected
    public var rate_limit_per_user: Int?
    /// the recipients of the DM
    public var recipients: [User]
    /// icon hash of the group DM
    public var icon: String?
    /// id of the creator of the group DM or thread
    public var owner_id: Snowflake?
    /// application id of the group DM creator if it is bot-created
    public var application_id: Snowflake?
    /// for group DM channels: whether the channel is managed by an application via the gdm.join OAuth2 scope
    public var managed: Bool?
    /// for guild channels: id of the parent category for a channel (each parent category can contain up to 50 channels), for threads: id of the text channel this thread was created
    public var parent_id: Snowflake?
    /// when the last pinned message was pinned. This may be null in events such as GUILD_CREATE when a message is not pinned.
    public var last_pin_timestamp: ISO8601Timestamp?
    /// voice region id for the voice channel, automatic when set to null
    public var rtc_region: String?
    /// the camera video quality mode of the voice channel, 1 when not present
    public var video_quality_mode: VideoQualityTag?
    /// number of messages (not including the initial message or deleted messages) in a thread.
    public var message_count: Int?
    /// an approximate count of users in a thread, stops counting at 50
    public var member_count: Int?
    /// thread-specific fields not needed by other channels
    public var thread_metadata: ThreadMetadata?
    /// thread member object for the current user, if they have joined the thread, only included on certain API endpoints
    public var member: ThreadMember?
    /// default duration, copied onto newly created threads, in minutes, threads will stop showing in the channel list after the specified period of inactivity, can be set to: 60, 1440, 4320, 10080
    public var default_auto_archive_duration: Int?
    /// computed permissions for the invoking user in the channel, including overwrites, only included when part of the resolved data received on a slash command interaction
    public var permissions: String?
    /// channel flags combined as a bitfield
    public var flags: ChannelFlags
    /// number of messages ever sent in a thread, it's similar to message_count on message creation, but will not decrement the number when a message is deleted
    public var total_message_sent: Int?
    /// the set of tags that can be used in a GUILD_FORUM channel
    public var available_tags: [ForumTag]?
    /// the IDs of the set of tags that have been applied to a thread in a GUILD_FORUM channel
    public var applied_tags: [Snowflake]
    /// the emoji to show in the add reaction button on a thread in a GUILD_FORUM channel
    public var default_reaction_emoji: DefaultReaction?
    /// the initial rate_limit_per_user to set on newly created threads in a channel. this field is copied to the thread at creation time and does not live update.
    public var default_thread_rate_limit_per_user: Int?
    /// the default sort order type used to order posts in GUILD_FORUM channels. Defaults to null, which indicates a preferred sort order hasn't been set by a channel admin
    public var default_sort_order: SortOrder?
    /// the default forum layout view used to display posts in GUILD_FORUM channels. Defaults to 0, which indicates a layout view has not been set by a channel admin
    public var default_forum_layout: ForumLayoutTypes?
}

public struct Message: Codable {
    /// id of the message
    public var id: Snowflake
    
    /// id of the channel the message was sent in
    public var channel_id: Snowflake
    
    /// the author of this message (not guaranteed to be a valid user, see below)
    public var author: User?
    
    /// contents of the message
    public var content: String
    
    /// when this message was sent
    public var timestamp: ISO8601Timestamp
    
    /// when this message was edited (or null if never)
    public var edited_timestamp: ISO8601Timestamp?
    
    /// whether this was a TTS message
    public var tts: Bool
    
    /// whether this message mentions everyone
    public var mention_everyone: Bool
    
    /// users specifically mentioned in the message
    public var mentions: [User]
    
    /// roles specifically mentioned in this message
    public var mention_roles: [Snowflake]
    
    /// channels specifically mentioned in this message
    public var mention_channels: [ChannelMention]?
    
    /// any attached files
    public var attachments: [Attachment]
    
    /// any embedded content
    public var embeds: [Embed]
    
    /// reactions to the message
    public var reactions: [Reaction]
    
    /// used for validating a message was sent
    public var nonce: Nonce?
    
    /// whether this message is pinned
    public var pinned: Bool
    
    /// if the message is generated by a webhook, this is the webhook's id
    public var webhook_id: Snowflake?
    
    /// type of message
    public var type: MessageType
    
    /// sent with Rich Presence-related chat embeds
    public var activity: MessageActivity?
    
    /// sent with Rich Presence-related chat embeds
    #warning("incomplete")
//    public var application?: partial application object
    
    /// if the message is an Interaction or application-owned webhook, this is the id of the application
    public var application_id: Snowflake?
    
    /// data showing the source of a crosspost, channel follow add, pin, or reply message
    public var message_reference: MessageReferenceObject?
    
    /// message flags combined as a bitfield
    public var flags: MessageFlags?
    
    /// the message associated with the message_reference
    #warning("issue with recursive reference to Message")
//    public var referenced_message: Message
    
    /// sent if the message is a response to an Interaction
//    public var interaction?: message interaction object
    
    /// the thread that was started from this message, includes thread member object
    public var thread: Channel?
    
    /// sent if the message contains components like buttons, action rows, or other interactive components
//    public var components?**: array of message components
    
    /// sent if the message contains stickers
//    public var sticker_items?: array of message sticker item objects
    
    /// Deprecated the stickers sent with the message
//    public var stickers?: array of sticker objects
    
    /// A generally increasing integer (there may be gaps or duplicates) that represents the approximate position of the message in a thread, it can be used to estimate the relative position of the message in a thread in company with total_message_sent on parent thread
    public var position: Int?
    
    /// data of the role subscription purchase or renewal that prompted this ROLE_SUBSCRIPTION_PURCHASE message
    public var role_subscription_data: RoleSubscriptionData?
}

public enum MessageType: Int, Codable {
    case DEFAULT = 0
    case RECIPIENT_ADD = 1
    case RECIPIENT_REMOVE = 2
    case CALL = 3
    case CHANNEL_NAME_CHANGE = 4
    case CHANNEL_ICON_CHANGE = 5
    case CHANNEL_PINNED_MESSAGE = 6
    case USER_JOIN = 7
    case GUILD_BOOST = 8
    case GUILD_BOOST_TIER_1 = 9
    case GUILD_BOOST_TIER_2 = 10
    case GUILD_BOOST_TIER_3 = 11
    case CHANNEL_FOLLOW_ADD = 12
    case GUILD_DISCOVERY_DISQUALIFIED = 14
    case GUILD_DISCOVERY_REQUALIFIED = 15
    case GUILD_DISCOVERY_GRACE_PERIOD_INITIAL_WARNING = 16
    case GUILD_DISCOVERY_GRACE_PERIOD_FINAL_WARNING = 17
    case THREAD_CREATED = 18
    case REPLY = 19
    case CHAT_INPUT_COMMAND = 20
    case THREAD_STARTER_MESSAGE = 21
    case GUILD_INVITE_REMINDER = 22
    case CONTEXT_MENU_COMMAND = 23
    case AUTO_MODERATION_ACTION = 24
    case ROLE_SUBSCRIPTION_PURCHASE = 25
    case INTERACTION_PREMIUM_UPSELL = 26
    case STAGE_START = 27
    case STAGE_END = 28
    case STAGE_SPEAKER = 29
    case STAGE_TOPIC = 31
    case GUILD_APPLICATION_PREMIUM_SUBSCRIPTION = 32
}

public struct MessageActivity: Codable {
    /// type of message activity
    var type: MessageActivityType
    
    /// party_id from a Rich Presence event
    var partyId: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case partyId = "party_id"
    }
}

public enum MessageActivityType: Int, Codable {
    case join = 1
    case spectate = 2
    case listen = 3
    case joinRequest = 5
}

public struct MessageFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// this message has been published to subscribed channels (via Channel Following)
    static let CROSSPOSTED = Self(rawValue: 1 << 0)
    
    /// this message originated from a message in another channel (via Channel Following)
    static let IS_CROSSPOST = Self(rawValue: 1 << 1)
    
    /// do not include any embeds when serializing this message
    static let SUPPRESS_EMBEDS = Self(rawValue: 1 << 2)
    
    /// the source message for this crosspost has been deleted (via Channel Following)
    static let SOURCE_MESSAGE_DELETED = Self(rawValue: 1 << 3)
    
    /// this message came from the urgent message system
    static let URGENT = Self(rawValue: 1 << 4)
    
    /// this message has an associated thread, with the same id as the message
    static let HAS_THREAD = Self(rawValue: 1 << 5)
    
    /// this message is only visible to the user who invoked the Interaction
    static let EPHEMERAL = Self(rawValue: 1 << 6)
    
    /// this message is an Interaction Response and the bot is "thinking"
    static let LOADING = Self(rawValue: 1 << 7)
    
    /// this message failed to mention some roles and add their members to the thread
    static let FAILED_TO_MENTION_SOME_ROLES_IN_THREAD = Self(rawValue: 1 << 8)
    
    /// this message will not trigger push and desktop notifications
    static let SUPPRESS_NOTIFICATIONS = Self(rawValue: 1 << 12)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}

public struct MessageReferenceObject: Codable {
    /// id of the originating message
    var message_id: Snowflake?
    
    /// id of the originating message's channel
    var channel_id: Snowflake?
    
    /// id of the originating message's guild
    var guild_id: Snowflake?
    
    /// when sending, whether to error if the referenced message doesn't exist instead of sending as a normal (non-reply) message, default true
    var fail_if_not_exists: Bool?
}

public struct FollowedChannel: Codable {
    /// source channel id
    var channel_id: Snowflake
    
    /// created target webhook id
    var webhook_id: Snowflake
}

public struct Reaction: Codable {
    /// times this emoji has been used to react
    var count: Int
    /// whether the current user reacted using this emoji
    var me: Bool
    /// emoji information
    #warning("missing")
//    var emoji: partial emoji object
}

public struct Overwrite: Codable {
    /// role or user id
    var id: Snowflake
    
    /// either 0 (role) or 1 (member)
    var type: Int
    
    /// permission bit set
    var allow: Permissions
    
    /// permission bit set
    var deny: Permissions
}

public struct ThreadMetadata: Codable {
    /// whether the thread is archived
    public var archived: Bool
    
    /// the thread will stop showing in the channel list after auto_archive_duration minutes of inactivity, can be set to: 60, 1440, 4320, 10080
    public var auto_archive_duration: Int
    
    /// timestamp when the thread's archive status was last changed, used for calculating recent activity
    public var archive_timestamp: ISO8601Timestamp
    
    /// whether the thread is locked; when a thread is locked, only users with MANAGE_THREADS can unarchive it
    public var locked: Bool
    
    /// whether non-moderators can add other non-moderators to a thread; only available on private threads
    public var invitable: Bool?
    
    /// timestamp when the thread was created; only populated for threads created after 2022-01-09
    public var create_timestamp: ISO8601Timestamp?
}

public struct ThreadMember: Codable {
    /// ID of the thread
    public var id: Snowflake?
    
    /// ID of the user
    public var user_id: Snowflake?
    
    /// Time the user last joined the thread
    public var join_timestamp: ISO8601Timestamp
    
    /// Any user-thread settings, currently only used for notifications
    public var flags: Int
    
    /// Additional information about the user
    #warning("missing")
//    public var member? * **    guild member object
}

public struct DefaultReaction: Codable {
    /// the id of a guild's custom emoji
    var emoji_id: Snowflake?
    
    /// the unicode character of the emoji
    var emoji_name: String
}

public struct ForumTag: Codable {
    /// the id of the tag
    var id: Snowflake?
    
    /// the name of the tag (0-20 characters)
    var name: String
    
    /// whether this tag can only be added to or removed from threads by a member with the MANAGE_THREADS permission
    var moderated: Bool
    
    /// the id of a guild's custom emoji *
    var emoji_id: Snowflake?
    
    /// the unicode character of the emoji *
    var emoji_name: String?
}

public struct Embed: Codable {
    /// title of embed
    public var title: String?
    
    /// type of embed (always "rich" for webhook embeds)
    public var type: EmbedType?
    
    /// description of embed
    public var description: String?
    
    /// url of embed
    public var url: String?
    
    /// timestamp of embed content
    public var timestamp: ISO8601Timestamp?
    
    /// color code of the embed
    public var color: Int?
    
    /// footer information
    public var footer: EmbedFooter?
    
    /// image information
    public var image: EmbedImage?
    
    /// thumbnail information
    public var thumbnail: EmbedThumbnail?
    
    /// video information
    public var video: EmbedVideo?
    
    /// provider information
    public var provider: EmbedProvider?
    
    /// author information
    public var author: EmbedAuthor?
    
    /// fields information
    public var fields: [EmbedFieldStructure]?
}

public enum EmbedType: String, Codable {
    /// generic embed rendered from embed attributes
    case rich = "rich"
    /// image embed
    case image = "image"
    /// video embed
    case video = "video"
    /// animated gif image embed rendered as a video embed
    case gifv = "gifv"
    /// article embed
    case article = "article"
    /// link embed
    case link = "link"
}

public struct EmbedThumbnail: Codable {
    /// source url of thumbnail (only supports http(s) and attachments)
    var url: String
    
    /// a proxied url of the thumbnail
    var proxy_url: String?
    
    /// height of thumbnail
    var height: Int?
    
    /// width of thumbnail
    var width: Int?
}

public struct EmbedVideo: Codable {
    /// source url of video
    public var url: String?
    
    /// a proxied url of the video
    public var proxy_url: String?
    
    /// height of video
    public var height: Int?
    
    /// width of video
    public var width: Int?
}

public struct EmbedImage: Codable {
    
    /// source url of image (only supports http(s) and attachments)
    public var url: String
    
    /// a proxied url of the image
    public var proxy_url: String?
    
    /// height of image
    public var height: Int?
    
    /// width of image
    public var width: Int?
}

public struct EmbedProvider: Codable {
    
    /// name of provider
    public var name: String?
    
    /// url of provider
    public var url: String?
}

public struct EmbedAuthor: Codable {
    /// name of author
    var name: String
    
    /// url of author (only supports http(s))
    var url: String?
    
    /// url of author icon (only supports http(s) and attachments)
    var icon_url: String?
    
    /// a proxied url of author icon
    var proxy_icon_url: String?
}

public struct EmbedFooter: Codable {
    /// footer text
    var text: String
    
    /// url of footer icon (only supports http(s) and attachments)
    var icon_url: String?
    
    /// a proxied url of footer icon
    var proxy_icon_url: String?
}

public struct EmbedFieldStructure: Codable {
    /// name of the field
    var name: String
    
    /// value of the field
    var value: String
    
    /// whether or not this field should display inline
    var inline: Bool?
}

public struct Attachment: Codable {
    /// attachment id
    public var id: Snowflake
    
    /// name of file attached
    public var filename: String
    
    /// description for the file (max 1024 characters)
    public var description: String?
    
    /// the attachment's media type
    public var content_type: String?
    
    /// size of file in bytes
    public var size: Int
    
    /// source url of file
    public var url: String
    
    /// a proxied url of file
    public var proxy_url: String
    
    /// height of file (if image)
    public var height: Int?
    
    /// width of file (if image)
    public var width: Int?
    
    /// whether this attachment is ephemeral
    public var ephemeral: Bool?
}

public struct ChannelMention: Codable {
    /// id of the channel
    var id: Snowflake
    
    /// id of the guild containing the channel
    var guild_id: Snowflake
    
    /// the type of channel
    var type: ChannelType
    
    /// the name of the channel
    var name: String
}

public enum AllowedMentionType: String, Codable {
    /// Controls role mentions
    case roles = "roles"
    
    /// Controls user mentions
    case users = "users"
    
    /// Controls @everyone and @here mentions
    case everyone = "everyone"
}

public struct AllowedMention: Codable {
    /// An array of allowed mention types to parse from the content.
    public var parse: [AllowedMentionType]
    
    /// Array of role_ids to mention (Max size of 100)
    var roles: [Snowflake]
    
    /// Array of user_ids to mention (Max size of 100)
    var users: [Snowflake]
    
    /// For replies, whether to mention the author of the message being replied to (default false)
    var replied_user: Bool = false
}

public struct RoleSubscriptionData: Codable {
    /// the id of the sku and listing that the user is subscribed to
    var role_subscription_listing_id: Snowflake
    
    /// the name of the tier that the user is subscribed to
    var tier_name: String
    
    /// the cumulative number of months that the user has been subscribed for
    var total_months_subscribed: Int
    
    /// whether this notification is for a renewal rather than a new purchase
    var is_renewal: Bool
}

public struct Nonce: Codable {
    public var rawValue: Any
    
    public var intValue: Int? {
        get {
            rawValue as? Int
        }
        set {
            if let newValue {
                rawValue = newValue
            }
        }
    }
    
    public var stringValue: String? {
        get {
            rawValue as? String
        }
        set {
            if let newValue {
                rawValue = newValue
            }
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(Int.self) {
            rawValue = value
        } else {
            let value = try container.decode(String.self)
            rawValue = value
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let intValue {
            try container.encode(intValue)
        } else if let stringValue {
            try container.encode(stringValue)
        }
    }
}
