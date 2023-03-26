//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct CreateDirectMessage: Codable {
    /// the recipient to open a DM channel with
    public var recipientId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case recipientId = "recipient_id"
    }
    
    public init(recipientId: Snowflake) {
        self.recipientId = recipientId
    }
    
    public static func create(with recipient: Snowflake) -> Self {
        Self(recipientId: recipient)
    }
}
