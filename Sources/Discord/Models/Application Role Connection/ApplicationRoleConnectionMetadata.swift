//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ApplicationRoleConnectionMetadata: Codable {
    /// type of metadata value
    public var type: ApplicationRoleConnectionMetadataType
    
    /// dictionary key for the metadata field (must be a-z, 0-9, or _ characters; 1-50 characters)
    public var key: String
    
    /// name of the metadata field (1-100 characters)
    public var name: String
    
    /// translations of the name
    public var nameLocalizations: [DiscordLocale: String]?
    
    /// description of the metadata field (1-200 characters)
    public var description: String
    
    /// translations of the description
    public var descriptionLocalizations: [DiscordLocale: String]?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case key = "key"
        case name = "name"
        case nameLocalizations = "name_localizations"
        case description = "description"
        case descriptionLocalizations = "description_localizations"
    }
}
