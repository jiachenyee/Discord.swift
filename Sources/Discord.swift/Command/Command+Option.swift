//
//  ApplicationCommandOption.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public extension Command {
    struct Option: Codable {
        
        public var type: OptionType
        
        public var name: String
        public var nameLocalizations: [DiscordLocale: String]?
        
        public var description: String
        public var descriptionLocalizations: [DiscordLocale: String]?
        
        public var required: Bool = false
        public var choices: [OptionChoice]?
        public var options: [Option]?
        public var channelTypes: [ChannelType]?
        public var minValue: Double?
        public var maxValue: Double?
        public var minLength: Int?
        public var maxLength: Int?
        public var autocomplete: Bool?
        
        public init(type: OptionType, name: String,
                    nameLocalizations: [DiscordLocale : String]? = nil,
                    description: String, descriptionLocalizations: [DiscordLocale : String]? = nil,
                    required: Bool, choices: [OptionChoice]? = nil, options: [Option]? = nil,
                    channelTypes: [ChannelType]? = nil, minValue: Double? = nil, maxValue: Double? = nil, minLength: Int? = nil, maxLength: Int? = nil, autocomplete: Bool? = nil) {
            self.type = type
            self.name = name
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
        
        public enum OptionType: String, Codable {
            case subCommand = "SUB_COMMAND"
            case subCommandGroup = "SUB_COMMAND_GROUP"
            case string = "STRING"
            case integer = "INTEGER"
            case boolean = "BOOLEAN"
            case user = "USER"
            case channel = "CHANNEL"
            case role = "ROLE"
            case mentionable = "MENTIONABLE"
            case number = "NUMBER"
            case attachment = "ATTACHMENT"
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
    }
}
