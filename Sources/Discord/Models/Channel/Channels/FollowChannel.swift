//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct FollowChannel: Codable {
    /// id of target channel
    public var webhookChannelId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case webhookChannelId = "webhook_channel_id"
    }
    
    public init(channelId: Snowflake) {
        self.webhookChannelId = channelId
    }
    
    public static func channel(id: Snowflake) -> Self {
        Self(channelId: id)
    }
}
