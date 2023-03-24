//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct NewThreadInformation: Codable {
    /// 1-100 character channel name
    public var name: String
    
    /// the thread will stop showing in the channel list after auto_archive_duration minutes of inactivity, can be set to: 60, 1440, 4320, 10080
    public var autoArchiveDuration: AutoArchiveDuration?
    
    /// amount of seconds a user has to wait before sending another message (0-21600)
    public var rateLimitPerUser: Int?
    
    public init(name: String, autoArchiveDuration: AutoArchiveDuration? = nil, rateLimitPerUser: Int? = nil) {
        self.name = name
        self.autoArchiveDuration = autoArchiveDuration
        self.rateLimitPerUser = rateLimitPerUser
    }
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case autoArchiveDuration = "auto_archive_duration"
        case rateLimitPerUser = "rate_limit_per_user"
    }
}
