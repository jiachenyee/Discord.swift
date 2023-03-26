//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ModifyWebhook: Codable {
    /// the default name of the webhook
    public var name: String?
    /// image for the default webhook avatar
    public var avatar: Data?
    /// the new channel id this webhook should be moved to
    public var channelId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case avatar = "avatar"
        case channelId = "channel_id"
    }
    
    init(name: String? = nil,
         avatar: Data? = nil,
         channelId: Snowflake? = nil) {
        self.name = name
        self.avatar = avatar
        self.channelId = channelId
    }
    
    public static func modifying(name: String? = nil,
                                 avatar: Data? = nil,
                                 channelId: Snowflake? = nil) -> Self {
        Self(name: name,
             avatar: avatar,
             channelId: channelId)
    }
}
