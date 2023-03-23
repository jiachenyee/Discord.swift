//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AutoModerationActionMetadata: Codable {
    /// channel to which user content should be logged
    public var channelId: Snowflake?
    
    /// timeout duration in seconds
    public var durationSeconds: Int?
    
    /// additional explanation that will be shown to members whenever their message is blocked    maximum of 150 characters
    public var customMessage: String?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case durationSeconds = "duration_seconds"
        case customMessage = "custom_message"
    }
    
    init(channelId: Snowflake? = nil, durationSeconds: Int? = nil, customMessage: String? = nil) {
        self.channelId = channelId
        self.durationSeconds = durationSeconds
        self.customMessage = customMessage
    }
}
