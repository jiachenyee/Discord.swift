//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct NewForumThread: Codable {
    /// 1-100 character channel name
    public var name: String
    
    /// duration in minutes to automatically archive the thread after recent activity, can be set to: 60, 1440, 4320, 10080
    public var autoArchiveDuration: AutoArchiveDuration
    
    /// amount of seconds a user has to wait before sending another message (0-21600)
    public var rateLimitPerUser: Int?
    
    /// contents of the first message in the forum thread
    public var message: NewForumThreadMessage
    
    /// the IDs of the set of tags that have been applied to a thread in a GUILD_FORUM channel
    public var appliedTags: [Snowflake]
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case autoArchiveDuration = "auto_archive_duration"
        case rateLimitPerUser = "rate_limit_per_user"
        case message = "message"
        case appliedTags = "applied_tags"
    }
    
    public init(name: String,
                autoArchiveDuration: AutoArchiveDuration,
                rateLimitPerUser: Int? = nil,
                message: NewForumThreadMessage,
                appliedTags: [Snowflake]) {
        self.name = name
        self.autoArchiveDuration = autoArchiveDuration
        self.rateLimitPerUser = rateLimitPerUser
        self.message = message
        self.appliedTags = appliedTags
    }
}
