//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayIntegrationDelete: GatewayEventData {
    /// Integration ID
    public var id: Snowflake
    
    /// ID of the guild
    public var guildId: Snowflake
    
    /// ID of the bot/OAuth2 application for this discord integration
    public var applicationId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case guildId = "guild_id"
        case applicationId = "application_id"
    }
}
