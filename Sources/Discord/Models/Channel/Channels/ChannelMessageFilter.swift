//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation
import Alamofire

public struct ChannelMessageFilter: Codable {
    /// Get messages around this message ID
    var around: Snowflake?
    
    /// Get messages before this message ID
    var before: Snowflake?
    
    /// Get messages after this message ID
    var after: Snowflake?
    
    /// Max number of messages to return (1-100)
    var limit: Int?
    
    func toParameters() -> Parameters {
        guard let jsonData = try? JSONEncoder().encode(self),
              let serializedData = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any] else { fatalError("Could not convert to JSON") }
        
        return serializedData
    }
    
    init(around: Snowflake? = nil, before: Snowflake? = nil, after: Snowflake? = nil, limit: Int? = nil) {
        self.around = around
        self.before = before
        self.after = after
        self.limit = limit
    }
    
    public static func filters(around: Snowflake? = nil,
                               before: Snowflake? = nil,
                               after: Snowflake? = nil,
                               limit: Int? = nil) -> Self {
        Self(around: around,
             before: before,
             after: after,
             limit: limit)
    }
}
