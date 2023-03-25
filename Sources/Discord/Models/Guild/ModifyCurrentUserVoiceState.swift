//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyCurrentUserVoiceState: Codable {
    /// the id of the channel the user is currently in
    public var channelId: Snowflake?
    
    /// toggles the user's suppress state
    public var suppress: Bool?
    
    /// sets the user's request to speak
    public var requestToSpeakTimestamp: ISO8601Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case suppress = "suppress"
        case requestToSpeakTimestamp = "request_to_speak_timestamp"
    }
}
