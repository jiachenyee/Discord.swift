//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayInviteDelete: GatewayEventData {
    /// Channel of the invite
    public var channelId: Snowflake
    /// Guild of the invite
    public var guildId: Snowflake?
    /// Unique invite code
    public var code: String
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case guildId = "guild_id"
        case code = "code"
    }
}
