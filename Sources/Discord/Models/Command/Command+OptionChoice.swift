//
//  ApplicationCommandOptionChoice.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public struct OptionChoice: Codable {
    public var name: String
    public var nameLocalizations: [DiscordLocale: String]?
    
    public var value: Value
    
    enum CodingKeys: String, CodingKey {
        case name
        case nameLocalizations = "name_localizations"
        case value
    }
    
    public init(name: String, nameLocalizations: [DiscordLocale: String]? = nil, value: Value) {
        self.name = name
        self.nameLocalizations = nameLocalizations
        self.value = value
    }
}
