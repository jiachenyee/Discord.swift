//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct BulkDeleteMessages: Codable {
    var messages: [Snowflake]
    
    public init(messages: [Snowflake]) {
        self.messages = messages
    }
    
    public static func messages(_ messageIds: [Snowflake]) -> Self {
        Self(messages: messageIds)
    }
}
