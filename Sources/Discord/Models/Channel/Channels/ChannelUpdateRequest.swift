//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum TextAnnouncementConversion: Int, Codable {
    /// a text channel within a server
    case guildText = 0
    /// a channel that users can follow and crosspost into their own server (formerly news channels)
    case guildAnnouncement = 5
}

public struct ChannelUpdateRequest: Codable {
    /// 1-100 character channel name
    /// - Scope: `All`
    public var name: String?
    
    /// the type of channel; only conversion between text and announcement is supported and only in guilds with the "NEWS" feature
    /// - Scope: `Text, Announcement`
    public var type: TextAnnouncementConversion?
    
    /// the position of the channel in the left-hand listing
    /// - Scope: `All`
    public var position: Int?
    
    /// 0-1024 character channel topic (0-4096 characters for GUILD_FORUM channels)
    /// - Scope: `Text, Announcement, Forum`
    public var topic: String?
    
    /// whether the channel is nsfw
    /// - Scope: `Text, Voice, Announcement, Stage, Forum`
    public var nsfw: Bool?
    
    /// amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected
    /// - Scope: `Text, Forum`
    public var rateLimitPerUser: Int?
    
    /// the bitrate (in bits) of the voice or stage channel; min 8000
    /// - Scope: `Voice, Stage`
    public var bitrate: Int?
    
    /// the user limit of the voice or stage channel, max 99 for voice channels and 10,000 for stage channels (0 refers to no limit)
    /// - Scope: `Voice, Stage`
    public var userLimit: Int?
    
    /// channel or category-specific permissions
    /// - Scope: `All`
    public var permissionOverwrites: [Overwrite]?
    
    /// id of the new parent category for a channel
    /// - Scope: `Text, Voice, Announcement, Stage, Forum`
    public var parentId: Snowflake?
    
    /// channel voice region id, automatic when set to null
    /// - Scope: `Voice, Stage`
    public var rtcRegion: String?
    
    /// the camera video quality mode of the voice channel
    /// - Scope: `Voice, Stage`
    public var videoQualityMode: Int?
    
    /// the default duration that the clients use (not the API) for newly created threads in the channel, in minutes, to automatically archive the thread after recent activity
    /// - Scope: `Text, Announcement, Forum`
    public var defaultAutoArchiveDuration: Int?
    
    /// channel flags combined as a bitfield. Currently only REQUIRE_TAG (1 << 4) is supported.
    /// - Scope: `Forum`
    public var flags: ChannelFlags?
    
    /// the set of tags that can be used in a GUILD_FORUM channel; limited to 20
    /// - Scope: `Forum`
    public var availableTags: [ForumTag]?
    
    /// the emoji to show in the add reaction button on a thread in a GUILD_FORUM channel
    /// - Scope: `Forum`
    public var defaultReactionEmoji: DefaultReaction?
    
    /// the initial rate_limit_per_user to set on newly created threads in a channel. this field is copied to the thread at creation time and does not live update.
    /// - Scope: `Text, Forum`
    public var defaultThreadRateLimitPerUser: Int?
    
    /// the default sort order type used to order posts in GUILD_FORUM channels
    /// - Scope: `Forum`
    public var defaultSortOrder: SortOrder?
    
    /// the default forum layout type used to display posts in GUILD_FORUM channels
    /// - Scope: `Forum`
    public var defaultForumLayout: ForumLayoutTypes?
    
    /// base64 encoded icon
    /// - Scope: `Group DM`
    public var icon: Data?
    
    /// whether the thread is archived
    public var archived: Bool?
    
    /// the thread will stop showing in the channel list after auto_archive_duration minutes of inactivity, can be set to: 60, 1440, 4320, 10080
    public var autoArchiveDuration: Int?
    
    /// whether the thread is locked; when a thread is locked, only users with MANAGE_THREADS can unarchive it
    public var locked: Bool?
    
    /// whether non-moderators can add other non-moderators to a thread; only available on private threads
    public var invitable: Bool?
    
    /// the IDs of the set of tags that have been applied to a thread in a GUILD_FORUM channel; limited to 5
    public var appliedTags: [Snowflake]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case position = "position"
        case topic = "topic"
        case nsfw = "nsfw"
        case rateLimitPerUser = "rate_limit_per_user"
        case bitrate = "bitrate"
        case userLimit = "user_limit"
        case permissionOverwrites = "permission_overwrites"
        case parentId = "parent_id"
        case rtcRegion = "rtc_region"
        case videoQualityMode = "video_quality_mode"
        case defaultAutoArchiveDuration = "default_auto_archive_duration"
        case flags = "flags"
        case availableTags = "available_tags"
        case defaultReactionEmoji = "default_reaction_emoji"
        case defaultThreadRateLimitPerUser = "default_thread_rate_limit_per_user"
        case defaultSortOrder = "default_sort_order"
        case defaultForumLayout = "default_forum_layout"
        case icon = "icon"
        case archived = "archived"
        case autoArchiveDuration = "auto_archive_duration"
        case locked = "locked"
        case invitable = "invitable"
        case appliedTags = "applied_tags"
    }
}
