//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct NewStageInstance: Codable {
    /// The id of the Stage channel
    public var channelId: Snowflake
    
    /// The topic of the Stage instance (1-120 characters)
    public var topic: String
    
    /// The privacy level of the Stage instance (default GUILD_ONLY)
    public var privacyLevel: StagePrivacyLevel = .guildOnly
    
    /// Notify @everyone that a Stage instance has started
    public var sendStartNotification: Bool
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case topic = "topic"
        case privacyLevel = "privacy_level"
        case sendStartNotification = "send_start_notification"
    }
    
    public init(channelId: Snowflake,
                topic: String,
                privacyLevel: StagePrivacyLevel = .guildOnly,
                sendStartNotification: Bool) {
        self.channelId = channelId
        self.topic = topic
        self.privacyLevel = privacyLevel
        self.sendStartNotification = sendStartNotification
    }
}
