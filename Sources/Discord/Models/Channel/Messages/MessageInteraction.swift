//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public struct MessageInteraction: GatewayEventData {
    /// ID of the interaction
    public var id: Snowflake
    
    /// ID of the application this interaction is for
    public var applicationId: Snowflake?
    
    /// Type of interaction
    public var type: InteractionType
    
    /// Interaction data payload
    public var data: InteractionData?
    
    /// Guild that the interaction was sent from
    public var guildId: Snowflake?
    
    /// Channel that the interaction was sent from
    public var channelId: Snowflake?
    
    /// Guild member data for the invoking user, including permissions
    public var member: GuildMember?
    
    /// User object for the invoking user, if invoked in a DM
    public var user: User?
    
    /// Continuation token for responding to the interaction
    public var token: String?
    
    /// Read-only property, always 1
    public var version: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case applicationId = "application_id"
        case type = "type"
        case data = "data"
        case guildId = "guild_id"
        case channelId = "channel_id"
        case member = "member"
        case user = "user"
        case token = "token"
        case version = "version"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Snowflake.self, forKey: .id)
        self.applicationId = try container.decodeIfPresent(Snowflake.self, forKey: .applicationId)
        self.type = try container.decode(InteractionType.self, forKey: .type)
        
        if container.allKeys.contains(.data) {
            self.data = try InteractionData(from: decoder)
        }
        
        self.guildId = try container.decodeIfPresent(Snowflake.self, forKey: .guildId)
        self.channelId = try container.decodeIfPresent(Snowflake.self, forKey: .channelId)
        self.member = try container.decodeIfPresent(GuildMember.self, forKey: .member)
        self.user = try container.decodeIfPresent(User.self, forKey: .user)
        self.token = try container.decodeIfPresent(String.self, forKey: .token)
        self.version = try container.decodeIfPresent(Int.self, forKey: .version)
    }
}
