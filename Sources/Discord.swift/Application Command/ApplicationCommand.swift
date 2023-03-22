//
//  ApplicationCommand.swift
//
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public struct ApplicationCommand: Codable {
    var id: Snowflake?
    var type: CommandType
    
    var applicationId: Snowflake??
    
    var guildId: Snowflake?
    
    var name: String
    var nameLocalizations: [DiscordLocale: String]?
    
    var description: String
    var descriptionLocalizations: [DiscordLocale: String]?
    
    var options: [Option]?
    
    var defaultMemberPermissions: String?
    var dmPermission: Bool?
    var nsfw = false
    var version: String?
    
    public init(type: CommandType = .chatInput,
                name: String,
                nameLocalizations: [DiscordLocale: String]? = nil,
                description: String,
                descriptionLocalizations: [DiscordLocale: String]? = nil,
                guildId: Snowflake? = nil,
                options: [Option]? = nil,
                defaultMemberPermissions: String? = nil,
                dmPermission: Bool? = nil,
                nsfw: Bool = false) {
        self.type = type
        self.guildId = guildId
        self.name = name
        self.nameLocalizations = nameLocalizations
        self.description = description
        self.descriptionLocalizations = descriptionLocalizations
        self.options = options
        self.defaultMemberPermissions = defaultMemberPermissions
        self.dmPermission = dmPermission
        self.nsfw = nsfw
    }
    
    public enum CommandType: Int, Codable {
        case chatInput = 1
        case user = 2
        case message = 3
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case applicationId = "application_id"
        case guildId = "guild_id"
        case name = "name"
        case nameLocalizations = "name_localizations"
        case description = "description"
        case descriptionLocalizations = "description_localizations"
        case options = "options"
        case defaultMemberPermissions = "default_member_permissions"
        case dmPermission = "dm_permission"
        case nsfw = "nsfw"
        case version = "version"
    }
    
    public static func chatInput(name: String,
                                 nameLocalizations: [DiscordLocale: String]? = nil,
                                 guildId: Snowflake? = nil,
                                 description: String,
                                 descriptionLocalizations: [DiscordLocale: String]? = nil,
                                 options: [Option]? = nil,
                                 defaultMemberPermissions: String? = nil,
                                 dmPermission: Bool? = nil,
                                 nsfw: Bool = false) -> Self {
        Self(type: .chatInput,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             guildId: guildId,
             options: options,
             defaultMemberPermissions: defaultMemberPermissions,
             dmPermission: dmPermission,
             nsfw: nsfw)
    }
    
    public static func user(name: String,
                            nameLocalizations: [DiscordLocale: String]? = nil,
                            description: String,
                            descriptionLocalizations: [DiscordLocale: String]? = nil,
                            guildId: Snowflake? = nil,
                            options: [Option]? = nil,
                            defaultMemberPermissions: String? = nil,
                            dmPermission: Bool? = nil,
                            nsfw: Bool = false) -> Self {
        Self(type: .user,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             guildId: guildId,
             options: options,
             defaultMemberPermissions: defaultMemberPermissions,
             dmPermission: dmPermission,
             nsfw: nsfw)
    }
    
    public static func message(name: String,
                               nameLocalizations: [DiscordLocale: String]? = nil,
                               description: String,
                               descriptionLocalizations: [DiscordLocale: String]? = nil,
                               guildId: Snowflake? = nil,
                               options: [Option]? = nil,
                               defaultMemberPermissions: String? = nil,
                               dmPermission: Bool? = nil,
                               nsfw: Bool = false) -> Self {
        Self(type: .message,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             guildId: guildId,
             options: options,
             defaultMemberPermissions: defaultMemberPermissions,
             dmPermission: dmPermission,
             nsfw: nsfw)
    }
}
