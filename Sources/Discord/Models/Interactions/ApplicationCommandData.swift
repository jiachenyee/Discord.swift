//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct ApplicationCommandData: GatewayEventData {
    /// the ID of the invoked command
    public var id: Snowflake
    /// the name of the invoked command
    public var name: String
    /// the type of the invoked command
    public var type: Command.CommandType
    /// converted users + roles + channels + attachments
    public var resolved: ResolvedData?
    /// the params + values from the user
    public var options: [ApplicationCommandInteractionDataOption]?
    /// the id of the guild the command is registered to
    public var guildId: Snowflake?
    /// id of the user or message targeted by a user or message command
    public var targetId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case resolved = "resolved"
        case options = "options"
        case guildId = "guild_id"
        case targetId = "target_id"
    }
}
