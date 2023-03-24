//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ArchivedThreads: Codable {
    public var threads: [Channel]
    public var members: [ThreadMember]
    public var hasMore: Bool
    
    enum CodingKeys: String, CodingKey {
        case threads = "threads"
        case members = "members"
        case hasMore = "has_more"
    }
    
    public init(threads: [Channel], members: [ThreadMember], hasMore: Bool) {
        self.threads = threads
        self.members = members
        self.hasMore = hasMore
    }
}
