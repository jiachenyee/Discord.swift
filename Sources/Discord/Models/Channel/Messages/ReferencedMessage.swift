//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ReferencedMessage: Codable {
    /// id of the message
    public var id: Snowflake
    
    /// id of the channel the message was sent in
    public var channelId: Snowflake
    
    /// the author of this message (not guaranteed to be a valid user, see below)
    public var author: User?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case channelId = "channel_id"
        case author = "author"
    }
}
