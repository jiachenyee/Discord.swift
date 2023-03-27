//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Presence: Codable {
    /// Unix time (in milliseconds) of when the client went idle, or null if the client is not idle
    public var since: Int?
    
    /// User's activities
    public var activities: [Activity]
    
    /// User's new status
    public var status: Status
    
    /// Whether or not the client is afk
    public var afk: Bool?
    
    public enum Status: String, Codable {
        case online = "online"
        case doNotDisturb = "dnd"
        case idle = "idle"
        case invisible = "invisible"
        case offline = "offline"
    }
    
    public init(since: Int? = nil, activities: [Activity], status: Status, afk: Bool) {
        self.since = since
        self.activities = activities
        self.status = status
        self.afk = afk
    }
    
    public static func online(activities: [Activity] = [], afk: Bool = false) -> Self {
        .init(activities: activities, status: .online, afk: afk)
    }
    
    public static func doNotDisturb(activities: [Activity] = [], afk: Bool = false) -> Self {
        .init(activities: activities, status: .doNotDisturb, afk: afk)
    }
    
    public static func idle(since date: Date, activities: [Activity] = [], afk: Bool = false) -> Self {
        .init(since: Int(date.timeIntervalSince1970 * 1000),
              activities: activities,
              status: .idle,
              afk: afk)
    }
    
    public static func invisible(activities: [Activity] = [], afk: Bool = false) -> Self {
        .init(activities: activities, status: .invisible, afk: afk)
    }
}
