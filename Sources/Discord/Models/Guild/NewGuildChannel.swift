//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct NewGuildChannel: Codable {
    /// channel name (1-100 characters)
    public var name: String
    
    /// the type of channel
    public var type: ChannelType
    
    /// channel topic (0-1024 characters)
    public var topic: String?
    
    /// the bitrate (in bits) of the voice or stage channel; min 8000
    public var bitrate: Int?
    
    /// the user limit of the voice channel
    public var userLimit: Int?
    
    /// amount of seconds a user has to wait before sending another message (0-21600); bots, as well as users with the permission manage_messages or manage_channel, are unaffected
    public var rateLimitPerUser: Int?
    
    /// sorting position of the channel
    public var position: Int?
    
    /// the channel's permission overwrites
    public var permissionOverwrites: [Overwrite]?
    
    /// id of the parent category for a channel
    public var parentId: Snowflake?
    
    /// whether the channel is nsfw
    public var nsfw: Bool?
    
    /// channel voice region id of the voice or stage channel, automatic when set to null
    public var rtcRegion: String?
    
    /// the camera video quality mode of the voice channel
    public var videoQualityMode: VideoQualityTag?
    
    /// the default duration that the clients use (not the API) for newly created threads in the channel, in minutes, to automatically archive the thread after recent activity
    public var defaultAutoArchiveDuration: Int?
    
    /// emoji to show in the add reaction button on a thread in a GUILD_FORUM channel
    public var defaultReactionEmoji: DefaultReaction?
    
    /// set of tags that can be used in a GUILD_FORUM channel
    public var availableTags: [ForumTag]?
    
    /// the default sort order type used to order posts in GUILD_FORUM channels
    public var defaultSortOrder: ForumSortOrder?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case type = "type"
        case topic = "topic"
        case bitrate = "bitrate"
        case userLimit = "user_limit"
        case rateLimitPerUser = "rate_limit_per_user"
        case position = "position"
        case permissionOverwrites = "permission_overwrites"
        case parentId = "parent_id"
        case nsfw = "nsfw"
        case rtcRegion = "rtc_region"
        case videoQualityMode = "video_quality_mode"
        case defaultAutoArchiveDuration = "default_auto_archive_duration"
        case defaultReactionEmoji = "default_reaction_emoji"
        case availableTags = "available_tags"
        case defaultSortOrder = "default_sort_order"
    }
    
    init(name: String, type: ChannelType,
         topic: String? = nil, bitrate: Int? = nil,
         userLimit: Int? = nil, rateLimitPerUser: Int? = nil,
         position: Int? = nil, permissionOverwrites: [Overwrite]? = nil,
         parentId: Snowflake? = nil, nsfw: Bool? = nil,
         rtcRegion: String? = nil, videoQualityMode: VideoQualityTag? = nil,
         defaultAutoArchiveDuration: Int? = nil,
         defaultReactionEmoji: DefaultReaction? = nil,
         availableTags: [ForumTag]? = nil,
         defaultSortOrder: ForumSortOrder? = nil) {
        self.name = name
        self.type = type
        self.topic = topic
        self.bitrate = bitrate
        self.userLimit = userLimit
        self.rateLimitPerUser = rateLimitPerUser
        self.position = position
        self.permissionOverwrites = permissionOverwrites
        self.parentId = parentId
        self.nsfw = nsfw
        self.rtcRegion = rtcRegion
        self.videoQualityMode = videoQualityMode
        self.defaultAutoArchiveDuration = defaultAutoArchiveDuration
        self.defaultReactionEmoji = defaultReactionEmoji
        self.availableTags = availableTags
        self.defaultSortOrder = defaultSortOrder
    }
    
    public static func text(name: String,
                            topic: String? = nil,
                            rateLimitPerUser: Int? = nil,
                            position: Int? = nil,
                            permissionOverwrites: [Overwrite]? = nil,
                            parentId: Snowflake? = nil,
                            nsfw: Bool? = nil,
                            defaultAutoArchiveDuration: Int? = nil) -> Self {
        Self(name: name,
             type: .guildText,
             topic: topic,
             rateLimitPerUser: rateLimitPerUser,
             position: position,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             nsfw: nsfw,
             defaultAutoArchiveDuration: defaultAutoArchiveDuration)
    }
    
    public static func voice(name: String,
                             bitrate: Int? = nil,
                             userLimit: Int? = nil,
                             position: Int? = nil,
                             permissionOverwrites: [Overwrite]? = nil,
                             parentId: Snowflake? = nil,
                             nsfw: Bool? = nil,
                             rtcRegion: String? = nil,
                             videoQualityMode: VideoQualityTag? = nil) -> Self {
        Self(name: name,
             type: .guildVoice,
             bitrate: bitrate,
             userLimit: userLimit,
             position: position,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             nsfw: nsfw,
             rtcRegion: rtcRegion,
             videoQualityMode: videoQualityMode)
    }
    
    public static func stage(name: String,
                             bitrate: Int? = nil,
                             userLimit: Int? = nil,
                             position: Int? = nil,
                             permissionOverwrites: [Overwrite]? = nil,
                             parentId: Snowflake? = nil,
                             nsfw: Bool? = nil,
                             rtcRegion: String? = nil,
                             videoQualityMode: VideoQualityTag? = nil) -> Self {
        Self(name: name,
             type: .guildStageVoice,
             bitrate: bitrate,
             userLimit: userLimit,
             position: position,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             nsfw: nsfw,
             rtcRegion: rtcRegion,
             videoQualityMode: videoQualityMode)
    }
    
    public static func category(name: String,
                                position: Int? = nil,
                                permissionOverwrites: [Overwrite]? = nil) -> Self {
        Self(name: name,
             type: .guildCategory,
             position: position,
             permissionOverwrites: permissionOverwrites)
    }
    
    public static func announcement(name: String,
                                    topic: String? = nil,
                                    rateLimitPerUser: Int? = nil,
                                    position: Int? = nil,
                                    permissionOverwrites: [Overwrite]? = nil,
                                    parentId: Snowflake? = nil,
                                    nsfw: Bool? = nil,
                                    defaultAutoArchiveDuration: Int? = nil) -> Self {
        Self(name: name,
             type: .guildAnnouncement,
             topic: topic,
             rateLimitPerUser: rateLimitPerUser,
             position: position,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             nsfw: nsfw,
             defaultAutoArchiveDuration: defaultAutoArchiveDuration)
    }
    
    public static func forum(name: String,
                             topic: String? = nil,
                             rateLimitPerUser: Int? = nil,
                             position: Int? = nil,
                             permissionOverwrites: [Overwrite]? = nil,
                             parentId: Snowflake? = nil,
                             nsfw: Bool? = nil,
                             defaultAutoArchiveDuration: Int? = nil,
                             defaultReactionEmoji: DefaultReaction? = nil,
                             availableTags: [ForumTag]? = nil,
                             defaultSortOrder: ForumSortOrder? = nil) -> Self {
        Self(name: name,
             type: .guildForum,
             topic: topic,
             rateLimitPerUser: rateLimitPerUser,
             position: position,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             nsfw: nsfw,
             defaultAutoArchiveDuration: defaultAutoArchiveDuration,
             defaultReactionEmoji: defaultReactionEmoji,
             availableTags: availableTags,
             defaultSortOrder: defaultSortOrder)
    }
}
