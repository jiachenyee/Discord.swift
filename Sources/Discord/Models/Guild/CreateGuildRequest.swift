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

public enum AFKTimeout: Int, Codable {
    case minute = 60
    case fiveMinutes = 300
    case fifteenMinutes = 900
    case thirtyMinutes = 1800
    case hour = 3600
}

public struct PartialChannel: Codable {
    /// temporary channel ID
    public var id: String
    /// the type of channel
    public var type: ChannelType
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
    
    public init(id: String,
                type: ChannelType, position: Int? = nil, permissionOverwrites: [Overwrite]? = nil, name: String? = nil, topic: String? = nil, nsfw: Bool? = nil, lastMessageId: Snowflake? = nil, bitrate: Int? = nil, userLimit: Int? = nil, rateLimitPerUser: Int? = nil, recipients: [User]? = nil, icon: String? = nil, ownerId: Snowflake? = nil, applicationId: Snowflake? = nil, managed: Bool? = nil, parentId: Snowflake? = nil, lastPinTimestamp: ISO8601Timestamp? = nil, rtcRegion: String? = nil, videoQualityMode: VideoQualityTag? = nil, messageCount: Int? = nil, memberCount: Int? = nil, threadMetadata: ThreadMetadata? = nil, member: ThreadMember? = nil, defaultAutoArchiveDuration: Int? = nil, permissions: String? = nil, flags: ChannelFlags? = nil, totalMessageSent: Int? = nil, availableTags: [ForumTag]? = nil, appliedTags: [Snowflake]? = nil, defaultReactionEmoji: DefaultReaction? = nil, defaultThreadRateLimitPerUser: Int? = nil, defaultSortOrder: ForumSortOrder? = nil, defaultForumLayout: ForumLayoutTypes? = nil) {
        self.id = id
        self.type = type
        self.position = position
        self.permissionOverwrites = permissionOverwrites
        self.name = name
        self.topic = topic
        self.nsfw = nsfw
        self.lastMessageId = lastMessageId
        self.bitrate = bitrate
        self.userLimit = userLimit
        self.rateLimitPerUser = rateLimitPerUser
        self.recipients = recipients
        self.icon = icon
        self.ownerId = ownerId
        self.applicationId = applicationId
        self.managed = managed
        self.parentId = parentId
        self.lastPinTimestamp = lastPinTimestamp
        self.rtcRegion = rtcRegion
        self.videoQualityMode = videoQualityMode
        self.messageCount = messageCount
        self.memberCount = memberCount
        self.threadMetadata = threadMetadata
        self.member = member
        self.defaultAutoArchiveDuration = defaultAutoArchiveDuration
        self.permissions = permissions
        self.flags = flags
        self.totalMessageSent = totalMessageSent
        self.availableTags = availableTags
        self.appliedTags = appliedTags
        self.defaultReactionEmoji = defaultReactionEmoji
        self.defaultThreadRateLimitPerUser = defaultThreadRateLimitPerUser
        self.defaultSortOrder = defaultSortOrder
        self.defaultForumLayout = defaultForumLayout
    }
}
