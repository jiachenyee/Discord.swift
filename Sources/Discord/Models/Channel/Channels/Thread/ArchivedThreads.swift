//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ArchivedThreads: Codable {
    var threads: [Channel]
    var members: [ThreadMember]
    var hasMore: Bool
    
    enum CodingKeys: String, CodingKey {
        case threads = "threads"
        case members = "members"
        case hasMore = "has_more"
    }
}
