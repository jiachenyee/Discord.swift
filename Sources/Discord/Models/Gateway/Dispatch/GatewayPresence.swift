//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayPresence: GatewayEventData {
    /// User whose presence is being updated
    public var user: User
    
    /// ID of the guild
    public var guildId: Snowflake
    
    /// Either "idle", "dnd", "online", or "offline"
    public var status: String
    
    /// User's current activities
    public var activities: [GatewayActivity]
    
    /// User's platform-dependent status
    public var clientStatus: GatewayClientStatus
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
        case guildId = "guild_id"
        case status = "status"
        case activities = "activities"
        case clientStatus = "client_status"
    }
}
