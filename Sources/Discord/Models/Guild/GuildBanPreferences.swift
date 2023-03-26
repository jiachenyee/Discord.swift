//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct GuildBanPreferences: Codable {
    /// number of seconds to delete messages for, between 0 and 604800 (7 days)
    public var deleteMessageSeconds: Int?
    
    public init(deleteMessageSeconds: Int? = nil) {
        self.deleteMessageSeconds = deleteMessageSeconds
    }
    
    enum CodingKeys: String, CodingKey {
        case deleteMessageSeconds = "delete_message_seconds"
    }
}
