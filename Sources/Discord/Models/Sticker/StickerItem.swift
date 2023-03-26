//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct StickerItem: Codable {
    /// id of the sticker
    public var id: Snowflake
    
    /// name of the sticker
    public var name: String
    
    /// type of sticker format
    public var formatType: StickerFormat
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case formatType = "format_type"
    }
    
    public init(id: Snowflake,
                name: String,
                formatType: StickerFormat) {
        self.id = id
        self.name = name
        self.formatType = formatType
    }
}
