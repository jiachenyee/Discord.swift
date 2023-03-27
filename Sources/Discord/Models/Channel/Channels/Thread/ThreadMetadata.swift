//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct ThreadMetadata: Codable {
    /// whether the thread is archived
    public var archived: Bool
    
    /// the thread will stop showing in the channel list after auto_archive_duration minutes of inactivity, can be set to: 60, 1440, 4320, 10080
    public var autoArchiveDuration: Int
    
    /// timestamp when the thread's archive status was last changed, used for calculating recent activity
    public var archiveTimestamp: ISO8601Timestamp
    
    /// whether the thread is locked; when a thread is locked, only users with MANAGE_THREADS can unarchive it
    public var locked: Bool
    
    /// whether non-moderators can add other non-moderators to a thread; only available on private threads
    public var invitable: Bool?
    
    /// timestamp when the thread was created; only populated for threads created after 2022-01-09
    public var createTimestamp: ISO8601Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case archived = "archived"
        case autoArchiveDuration = "auto_archive_duration"
        case archiveTimestamp = "archive_timestamp"
        case locked = "locked"
        case invitable = "invitable"
        case createTimestamp = "create_timestamp"
    }
    
    public init(archived: Bool,
                autoArchiveDuration: Int,
                archiveTimestamp: ISO8601Timestamp,
                locked: Bool,
                invitable: Bool? = nil,
                createTimestamp: ISO8601Timestamp? = nil) {
        self.archived = archived
        self.autoArchiveDuration = autoArchiveDuration
        self.archiveTimestamp = archiveTimestamp
        self.locked = locked
        self.invitable = invitable
        self.createTimestamp = createTimestamp
    }
}
