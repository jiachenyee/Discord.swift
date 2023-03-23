//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension ChannelUpdateRequest {
    static func text(name: String? = nil,
                     type: TextAnnouncementConversion? = nil,
                     position: Int? = nil,
                     topic: String? = nil,
                     nsfw: Bool? = nil,
                     rateLimitPerUser: Int? = nil,
                     permissionOverwrites: [Overwrite]? = nil,
                     parentId: Snowflake? = nil,
                     defaultAutoArchiveDuration: Int? = nil,
                     defaultThreadRateLimitPerUser: Int? = nil) -> Self {
        Self(name: name,
             type: type,
             position: position,
             topic: topic,
             nsfw: nsfw,
             rateLimitPerUser: rateLimitPerUser,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             defaultAutoArchiveDuration: defaultAutoArchiveDuration,
             defaultThreadRateLimitPerUser: defaultThreadRateLimitPerUser)
    }
    
    static func voice(name: String? = nil,
                      position: Int? = nil,
                      nsfw: Bool? = nil,
                      bitrate: Int? = nil,
                      userLimit: Int? = nil,
                      permissionOverwrites: [Overwrite]? = nil,
                      parentId: Snowflake? = nil,
                      rtcRegion: String? = nil,
                      videoQualityMode: Int? = nil) -> Self {
        Self(name: name,
             position: position,
             nsfw: nsfw,
             bitrate: bitrate,
             userLimit: userLimit,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             rtcRegion: rtcRegion,
             videoQualityMode: videoQualityMode)
    }
    
    static func groupDM(name: String? = nil,
                        icon: Data? = nil) -> Self {
        Self(name: name,
             icon: icon)
    }
    
    static func category(name: String? = nil,
                         position: Int? = nil,
                         permissionOverwrites: [Overwrite]? = nil) -> Self {
        Self(name: name,
             position: position,
             permissionOverwrites: permissionOverwrites)
    }
    
    static func announcement(name: String? = nil,
                             type: TextAnnouncementConversion? = nil,
                             position: Int? = nil,
                             topic: String? = nil,
                             nsfw: Bool? = nil,
                             permissionOverwrites: [Overwrite]? = nil,
                             parentId: Snowflake? = nil,
                             defaultAutoArchiveDuration: Int? = nil) -> Self {
        Self(name: name,
             type: type,
             position: position,
             topic: topic,
             nsfw: nsfw,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             defaultAutoArchiveDuration: defaultAutoArchiveDuration)
    }
    
    static func thread(name: String? = nil,
                       archived: Bool? = nil,
                       autoArchiveDuration: Int? = nil,
                       locked: Bool? = nil,
                       invitable: Bool? = nil,
                       rateLimitPerUser: Int? = nil,
                       flags: ChannelFlags? = nil,
                       appliedTags: [Snowflake]?) -> Self {
        Self(name: name,
             rateLimitPerUser: rateLimitPerUser,
             flags: flags,
             archived: archived,
             autoArchiveDuration: autoArchiveDuration,
             locked: locked,
             invitable: invitable,
             appliedTags: appliedTags)
    }
    
    static func stage(name: String? = nil,
                      position: Int? = nil,
                      nsfw: Bool? = nil,
                      bitrate: Int? = nil,
                      userLimit: Int? = nil,
                      permissionOverwrites: [Overwrite]? = nil,
                      parentId: Snowflake? = nil,
                      rtcRegion: String? = nil,
                      videoQualityMode: Int? = nil) -> Self {
        Self(name: name,
             position: position,
             nsfw: nsfw,
             bitrate: bitrate,
             userLimit: userLimit,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             rtcRegion: rtcRegion,
             videoQualityMode: videoQualityMode)
    }
    
    static func directory(name: String? = nil,
                          position: Int? = nil,
                          permissionOverwrites: [Overwrite]? = nil) -> Self {
        Self(name: name,
             position: position,
             permissionOverwrites: permissionOverwrites)
    }
    
    static func forum(name: String? = nil,
                      position: Int? = nil,
                      topic: String? = nil,
                      nsfw: Bool? = nil,
                      rateLimitPerUser: Int? = nil,
                      permissionOverwrites: [Overwrite]? = nil,
                      parentId: Snowflake? = nil,
                      defaultAutoArchiveDuration: Int? = nil,
                      flags: ChannelFlags? = nil,
                      availableTags: [ForumTag]? = nil,
                      defaultReactionEmoji: DefaultReaction? = nil,
                      defaultThreadRateLimitPerUser: Int? = nil,
                      defaultSortOrder: SortOrder? = nil,
                      defaultForumLayout: ForumLayoutTypes? = nil) -> Self {
        Self(name: name,
             position: position,
             topic: topic,
             nsfw: nsfw,
             rateLimitPerUser: rateLimitPerUser,
             permissionOverwrites: permissionOverwrites,
             parentId: parentId,
             defaultAutoArchiveDuration: defaultAutoArchiveDuration,
             flags: flags,
             availableTags: availableTags,
             defaultReactionEmoji: defaultReactionEmoji,
             defaultThreadRateLimitPerUser: defaultThreadRateLimitPerUser,
             defaultSortOrder: defaultSortOrder,
             defaultForumLayout: defaultForumLayout)
    }
}
