//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyUserVoiceState: Codable {
    /// the id of the channel the user is currently in
    public var channelId: Snowflake?
    
    /// toggles the user's suppress state
    public var suppress: Bool?
    
    public init(channelId: Snowflake? = nil, suppress: Bool? = nil) {
        self.channelId = channelId
        self.suppress = suppress
    }
    
    public static func modifying(channelId: Snowflake? = nil,
                                 suppress: Bool? = nil) -> Self {
        Self(channelId: channelId,
             suppress: suppress)
    }
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case suppress = "suppress"
    }
}
