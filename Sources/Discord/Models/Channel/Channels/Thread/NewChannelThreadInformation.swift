//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct NewChannelThreadInformation: Codable {
    /// 1-100 character channel name
    public var name: String
    
    /// the thread will stop showing in the channel list after auto_archive_duration minutes of inactivity, can be set to: 60, 1440, 4320, 10080
    public var autoArchiveDuration: AutoArchiveDuration?
    
    /// the type of thread to create
    public var type: ThreadType = .publicThread
    
    /// whether non-moderators can add other non-moderators to a thread; only available when creating a private thread
    public var invitable: Bool?
    
    /// amount of seconds a user has to wait before sending another message (0-21600)
    public var rateLimitPerUser: Int?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case autoArchiveDuration = "auto_archive_duration"
        case type = "type"
        case invitable = "invitable"
        case rateLimitPerUser = "rate_limit_per_user"
    }
    
    public init(name: String, autoArchiveDuration: AutoArchiveDuration? = nil, type: ThreadType = .publicThread, invitable: Bool? = nil, rateLimitPerUser: Int? = nil) {
        self.name = name
        self.autoArchiveDuration = autoArchiveDuration
        self.type = type
        self.invitable = invitable
        self.rateLimitPerUser = rateLimitPerUser
    }
    
    public static func privateThread(name: String,
                                     autoArchiveDuration: AutoArchiveDuration? = nil,
                                     invitable: Bool? = nil, rateLimitPerUser: Int? = nil) -> Self {
        Self(name: name,
             autoArchiveDuration: autoArchiveDuration,
             type: .privateThread,
             invitable: invitable,
             rateLimitPerUser: rateLimitPerUser)
    }
    
    public static func publicThread(name: String,
                                    autoArchiveDuration: AutoArchiveDuration? = nil,
                                    rateLimitPerUser: Int? = nil) -> Self {
        Self(name: name,
             autoArchiveDuration: autoArchiveDuration,
             type: .publicThread,
             rateLimitPerUser: rateLimitPerUser)
    }
}
