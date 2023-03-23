//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Channel: Codable {
    /// the id of this channel
    public var id: Snowflake
    /// the type of channel
    public var type: ChannelType
    /// the id of the guild (may be missing for some channel objects received over gateway guild dispatches)
    public var guildId: Snowflake
    /// sorting position of the channel
    public var position: Int?
    /// explicit permission overwrites for members and roles
    public var permissionOverwrites: [Overwrite]?
    /// the name of the channel (1-100 characters)
    public var name: String?
    /// the channel topic (0-4096 characters for GUILD_FORUM channels, 0-1024 characters for all others)
    public var topic: String?
    /// whether the channel is nsfw
    public var nsfw: Bool?
    /// the id of the last message sent in this channel (or thread for GUILD_FORUM channels) (may not point to an existing or valid message or thread)
    public var lastMessageId: Snowflake?
    /// the bitrate (in bits) of the voice channel
    public var bitrate: Int?
    /// the user limit of the voice channel
    public var userLimit: Int?
    /// amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected
    public var rateLimitPerUser: Int?
    /// the recipients of the DM
    public var recipients: [User]?
    /// icon hash of the group DM
    public var icon: String?
    /// id of the creator of the group DM or thread
    public var ownerId: Snowflake?
    /// application id of the group DM creator if it is bot-created
    public var applicationId: Snowflake?
    /// for group DM channels: whether the channel is managed by an application via the gdm.join OAuth2 scope
    public var managed: Bool?
    /// for guild channels: id of the parent category for a channel (each parent category can contain up to 50 channels), for threads: id of the text channel this thread was created
    public var parentId: Snowflake?
    /// when the last pinned message was pinned. This may be null in events such as GUILD_CREATE when a message is not pinned.
    public var lastPinTimestamp: ISO8601Timestamp?
    /// voice region id for the voice channel, automatic when set to null
    public var rtcRegion: String?
    /// the camera video quality mode of the voice channel, 1 when not present
    public var videoQualityMode: VideoQualityTag?
    /// number of messages (not including the initial message or deleted messages) in a thread.
    public var messageCount: Int?
    /// an approximate count of users in a thread, stops counting at 50
    public var memberCount: Int?
    /// thread-specific fields not needed by other channels
    public var threadMetadata: ThreadMetadata?
    /// thread member object for the current user, if they have joined the thread, only included on certain API endpoints
    public var member: ThreadMember?
    /// default duration, copied onto newly created threads, in minutes, threads will stop showing in the channel list after the specified period of inactivity, can be set to: 60, 1440, 4320, 10080
    public var defaultAutoArchiveDuration: Int?
    /// computed permissions for the invoking user in the channel, including overwrites, only included when part of the resolved data received on a slash command interaction
    public var permissions: String?
    /// channel flags combined as a bitfield
    public var flags: ChannelFlags?
    /// number of messages ever sent in a thread, it's similar to message_count on message creation, but will not decrement the number when a message is deleted
    public var totalMessageSent: Int?
    /// the set of tags that can be used in a GUILD_FORUM channel
    public var availableTags: [ForumTag]?
    /// the IDs of the set of tags that have been applied to a thread in a GUILD_FORUM channel
    public var appliedTags: [Snowflake]?
    /// the emoji to show in the add reaction button on a thread in a GUILD_FORUM channel
    public var defaultReactionEmoji: DefaultReaction?
    /// the initial rate_limit_per_user to set on newly created threads in a channel. this field is copied to the thread at creation time and does not live update.
    public var defaultThreadRateLimitPerUser: Int?
    /// the default sort order type used to order posts in GUILD_FORUM channels. Defaults to null, which indicates a preferred sort order hasn't been set by a channel admin
    public var defaultSortOrder: ForumSortOrder?
    /// the default forum layout view used to display posts in GUILD_FORUM channels. Defaults to 0, which indicates a layout view has not been set by a channel admin
    public var defaultForumLayout: ForumLayoutTypes?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case guildId = "guild_id"
        case position = "position"
        case permissionOverwrites = "permission_overwrites"
        case name = "name"
        case topic = "topic"
        case nsfw = "nsfw"
        case lastMessageId = "last_message_id"
        case bitrate = "bitrate"
        case userLimit = "user_limit"
        case rateLimitPerUser = "rate_limit_per_user"
        case recipients = "recipients"
        case icon = "icon"
        case ownerId = "owner_id"
        case applicationId = "application_id"
        case managed = "managed"
        case parentId = "parent_id"
        case lastPinTimestamp = "last_pin_timestamp"
        case rtcRegion = "rtc_region"
        case videoQualityMode = "video_quality_mode"
        case messageCount = "message_count"
        case memberCount = "member_count"
        case threadMetadata = "thread_metadata"
        case member = "member"
        case defaultAutoArchiveDuration = "default_auto_archive_duration"
        case permissions = "permissions"
        case flags = "flags"
        case totalMessageSent = "total_message_sent"
        case availableTags = "available_tags"
        case appliedTags = "applied_tags"
        case defaultReactionEmoji = "default_reaction_emoji"
        case defaultThreadRateLimitPerUser = "default_thread_rate_limit_per_user"
        case defaultSortOrder = "default_sort_order"
        case defaultForumLayout = "default_forum_layout"
    }
}

public struct FollowedChannel: Codable {
    /// source channel id
    var channel_id: Snowflake
    
    /// created target webhook id
    var webhook_id: Snowflake
}

public struct DefaultReaction: Codable {
    /// the id of a guild's custom emoji
    var emoji_id: Snowflake?
    
    /// the unicode character of the emoji
    var emoji_name: String
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
