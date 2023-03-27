//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct Interaction: GatewayEventData {
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
    public var version: Int
    
    /// For components, the message they were attached to
    public var message: Message?
    
    /// Bitwise set of permissions the app or bot has within the channel the interaction was sent from
    public var appPermissions: String?
    
    /// Selected language of the invoking user
    public var locale: DiscordLocale?
    
    /// Guild's preferred locale, if invoked in a guild
    public var guildLocale: DiscordLocale?
    
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
        case message = "message"
        case appPermissions = "app_permissions"
        case locale = "locale"
        case guildLocale = "guild_locale"
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
        self.token = try container.decode(String.self, forKey: .token)
        self.version = try container.decode(Int.self, forKey: .version)
        self.message = try container.decodeIfPresent(Message.self, forKey: .message)
        self.appPermissions = try container.decodeIfPresent(String.self, forKey: .appPermissions)
        self.locale = try container.decodeIfPresent(DiscordLocale.self, forKey: .locale)
        self.guildLocale = try container.decodeIfPresent(DiscordLocale.self, forKey: .guildLocale)
    }
}

public struct ResolvedData: GatewayEventData {
    /// the ids and User objects
    public var users: [Snowflake: User]?
    
    /// the ids and partial Member objects
    public var members: [Snowflake: GuildMember]?
    
    /// the ids and Role objects
    public var roles: [Snowflake: Role]?
    
    /// the ids and partial Channel objects
    public var channels: [Snowflake: PartialChannel]?
    
    /// the ids and partial Message objects
    public var messages: [Snowflake: Message]?
    
    /// the ids and attachment objects
    public var attachments: [Snowflake: Attachment]?
}

public struct ApplicationCommandInteractionDataOption: Codable {
    /// Name of the parameter
    public var name: String
    /// Value of application command option type
    public var type: Command.Option.OptionType
    /// Value of the option resulting from user input
    public var value: Mixed?
    
    /// Present if this option is a group or subcommand
    public var options: [Self]?
    
    /// true if this option is the currently focused option for autocomplete
    public var focused: Bool?
}
