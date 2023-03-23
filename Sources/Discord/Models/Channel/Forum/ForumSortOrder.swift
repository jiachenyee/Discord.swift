//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum ForumSortOrder: Int, Codable {
    /// Sort forum posts by activity
    case latestActivity = 0
    
    /// Sort forum posts by creation time (from most recent to oldest)
    case creationDate = 1
}
