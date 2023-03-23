//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct FollowedChannel: Codable {
    /// source channel id
    var channelId: Snowflake
    
    /// created target webhook id
    var webhookId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case webhookId = "webhook_id"
    }
}
