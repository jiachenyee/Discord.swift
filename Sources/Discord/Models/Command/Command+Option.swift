//
//  ApplicationCommandOption.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public struct CommandOption: Codable {
    
    public var type: OptionType
    
    public var name: String
    public var nameLocalizations: [DiscordLocale: String]?
    
    public var description: String
    public var descriptionLocalizations: [DiscordLocale: String]?
    
    public var required: Bool? = false
    public var choices: [OptionChoice]?
    public var options: [CommandOption]?
    public var channelTypes: [ChannelType]?
    public var minValue: Double?
    public var maxValue: Double?
    public var minLength: Int?
    public var maxLength: Int?
    public var autocomplete: Bool?
    
    public init(type: OptionType, name: String,
                nameLocalizations: [DiscordLocale: String]? = nil,
                description: String, descriptionLocalizations: [DiscordLocale: String]? = nil,
                required: Bool, choices: [OptionChoice]? = nil, options: [CommandOption]? = nil,
                channelTypes: [ChannelType]? = nil,
                minValue: Double? = nil,
                maxValue: Double? = nil,
                minLength: Int? = nil,
                maxLength: Int? = nil, autocomplete: Bool? = nil) {
        self.type = type
        self.name = name.lowercased()
        self.nameLocalizations = nameLocalizations
        self.description = description
        self.descriptionLocalizations = descriptionLocalizations
        self.required = required
        self.choices = choices
        self.options = options
        self.channelTypes = channelTypes
        self.minValue = minValue
        self.maxValue = maxValue
        self.minLength = minLength
        self.maxLength = maxLength
        self.autocomplete = autocomplete
    }
    
    public enum OptionType: Int, Codable {
        case subCommand = 1
        case subCommandGroup = 2
        case string = 3
        case integer = 4
        case boolean = 5
        case user = 6
        case channel = 7
        case role = 8
        case mentionable = 9
        case number = 10
        case attachment = 11
    }
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case name = "name"
        case nameLocalizations = "name_localizations"
        case description = "description"
        case descriptionLocalizations = "description_localizations"
        case required = "required"
        case choices = "choices"
        case options = "options"
        case channelTypes = "channel_types"
        case minValue = "min_value"
        case maxValue = "max_value"
        case minLength = "min_length"
        case maxLength = "max_length"
        case autocomplete = "autocomplete"
    }
    
    public static func subCommand(name: String,
                                  nameLocalizations: [DiscordLocale: String]? = nil,
                                  description: String,
                                  descriptionLocalizations: [DiscordLocale: String]? = nil,
                                  required: Bool = false,
                                  options: [CommandOption]? = nil) -> Self {
        Self(type: .subCommand,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required,
             options: options)
    }
    
    public static func subCommandGroup(name: String,
                                       nameLocalizations: [DiscordLocale: String]? = nil,
                                       description: String,
                                       descriptionLocalizations: [DiscordLocale: String]? = nil,
                                       required: Bool = false,
                                       options: [CommandOption]? = nil) -> Self {
        Self(type: .subCommand,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required,
             options: options)
    }
    
    public static func string(name: String,
                              nameLocalizations: [DiscordLocale: String]? = nil,
                              description: String,
                              descriptionLocalizations: [DiscordLocale: String]? = nil,
                              required: Bool = false,
                              choices: [OptionChoice]? = nil,
                              minLength: Int? = nil,
                              maxLength: Int? = nil,
                              autocomplete: Bool? = nil) -> Self {
        Self(type: .string,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required,
             choices: choices,
             minLength: minLength,
             maxLength: maxLength,
             autocomplete: autocomplete)
    }
    
    public static func integer(name: String,
                               nameLocalizations: [DiscordLocale: String]? = nil,
                               description: String,
                               descriptionLocalizations: [DiscordLocale: String]? = nil,
                               required: Bool = false,
                               choices: [OptionChoice]? = nil,
                               minValue: Double? = nil,
                               maxValue: Double? = nil,
                               autocomplete: Bool? = nil) -> Self {
        Self(type: .integer,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required,
             choices: choices,
             minValue: minValue,
             maxValue: maxValue,
             autocomplete: autocomplete)
    }
    
    public static func boolean(name: String,
                               nameLocalizations: [DiscordLocale: String]? = nil,
                               description: String,
                               descriptionLocalizations: [DiscordLocale: String]? = nil,
                               required: Bool = false) -> Self {
        Self(type: .boolean,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required)
    }
    
    public static func user(name: String,
                            nameLocalizations: [DiscordLocale: String]? = nil,
                            description: String,
                            descriptionLocalizations: [DiscordLocale: String]? = nil,
                            required: Bool = false) -> Self {
        Self(type: .user,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required)
    }
    
    public static func channel(name: String,
                               nameLocalizations: [DiscordLocale: String]? = nil,
                               description: String,
                               descriptionLocalizations: [DiscordLocale: String]? = nil,
                               types channelTypes: [ChannelType]? = nil,
                               required: Bool = false) -> Self {
        Self(type: .channel,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required,
             channelTypes: channelTypes)
    }
    
    public static func role(name: String,
                            nameLocalizations: [DiscordLocale: String]? = nil,
                            description: String,
                            descriptionLocalizations: [DiscordLocale: String]? = nil,
                            required: Bool = false) -> Self {
        Self(type: .role,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required)
    }
    
    public static func mentionable(name: String,
                                   nameLocalizations: [DiscordLocale: String]? = nil,
                                   description: String,
                                   descriptionLocalizations: [DiscordLocale: String]? = nil,
                                   required: Bool = false) -> Self {
        Self(type: .mentionable,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required)
    }
    
    public static func number(name: String,
                              nameLocalizations: [DiscordLocale: String]? = nil,
                              description: String,
                              descriptionLocalizations: [DiscordLocale: String]? = nil,
                              required: Bool = false,
                              choices: [OptionChoice]? = nil,
                              minValue: Double? = nil,
                              maxValue: Double? = nil,
                              autocomplete: Bool? = nil) -> Self {
        Self(type: .number,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required,
             choices: choices,
             minValue: minValue,
             maxValue: maxValue,
             autocomplete: autocomplete)
    }
    
    public static func attachment(name: String,
                                  nameLocalizations: [DiscordLocale: String]? = nil,
                                  description: String,
                                  descriptionLocalizations: [DiscordLocale: String]? = nil,
                                  required: Bool = false) -> Self {
        Self(type: .attachment,
             name: name,
             nameLocalizations: nameLocalizations,
             description: description,
             descriptionLocalizations: descriptionLocalizations,
             required: required)
    }
    }
