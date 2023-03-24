//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ArchivedThreadFilter: Parameterable {
    public var before: ISO8601Timestamp?
    public var limit: Int?
    
    public init(before: ISO8601Timestamp? = nil, limit: Int? = nil) {
        self.before = before
        self.limit = limit
    }
    
    public static func using(before: ISO8601Timestamp? = nil,
                             limit: Int? = nil) -> Self {
        Self(before: before,
             limit: limit)
    }
}
