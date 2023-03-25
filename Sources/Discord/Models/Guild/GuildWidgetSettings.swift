//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildWidgetSettings: Codable {
    /// whether the widget is enabled
    public var enabled: Bool
    
    /// the widget channel id
    public var channelId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case enabled = "enabled"
        case channelId = "channel_id"
    }
    
    public init(enabled: Bool, channelId: Snowflake) {
        self.enabled = enabled
        self.channelId = channelId
    }
}
