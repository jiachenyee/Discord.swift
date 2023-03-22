//
//  ApplicationCommandOptionChoice.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public extension ApplicationCommand {
    struct OptionChoice: Codable {
        var name: String
        var nameLocalizations: [DiscordLocale: String]?
        
        var value: Value
        
        enum CodingKeys: String, CodingKey {
            case name
            case nameLocalizations = "name_localizations"
            case value
        }
        
        public init(name: String, nameLocalizations: [DiscordLocale : String]? = nil, value: Value) {
            self.name = name
            self.nameLocalizations = nameLocalizations
            self.value = value
        }
    }
}
