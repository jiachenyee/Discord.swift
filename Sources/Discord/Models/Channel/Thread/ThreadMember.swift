//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct ThreadMember: Codable {
    /// ID of the thread
    public var id: Snowflake?
    
    /// ID of the user
    public var user_id: Snowflake?
    
    /// Time the user last joined the thread
    public var join_timestamp: ISO8601Timestamp
    
    /// Any user-thread settings, currently only used for notifications
    public var flags: Int
    
    /// Additional information about the user
#warning("missing")
    //    public var member? * **    guild member object
}
