//
//  ApplicationCommand.swift
//
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public struct ApplicationCommand: Codable {
    var id: String
    var type: CommandType
    
    var applicationId: String?
    
    var guildId: String?
    
    var name: String
    var nameLocalizations: [DiscordLocale: String]?
    
    var description: String
    var descriptionLocalizations: [DiscordLocale: String]?
    
    var options: [Option]
    
    var defaultMemberPermissions: String?
    var dmPermission: Bool?
    var nsfw = false
    var version: String
    
    public init(id: String, type: CommandType,
                applicationId: String? = nil, guildId: String? = nil,
                name: String, nameLocalizations: [DiscordLocale : String]? = nil,
                description: String, descriptionLocalizations: [DiscordLocale : String]? = nil,
                options: [Option], defaultMemberPermissions: String? = nil, dmPermission: Bool? = nil,
                nsfw: Bool = false, version: String) {
        self.id = id
        self.type = type
        self.applicationId = applicationId
        self.guildId = guildId
        self.name = name
        self.nameLocalizations = nameLocalizations
        self.description = description
        self.descriptionLocalizations = descriptionLocalizations
        self.options = options
        self.defaultMemberPermissions = defaultMemberPermissions
        self.dmPermission = dmPermission
        self.nsfw = nsfw
        self.version = version
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
}
