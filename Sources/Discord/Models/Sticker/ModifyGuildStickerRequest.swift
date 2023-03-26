//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ModifyGuildStickerRequest: Codable {
    /// name of the sticker (2-30 characters)
    public var name: String?
    
    /// description of the sticker (2-100 characters)
    public var description: String?
    
    /// autocomplete/suggestion tags for the sticker (max 200 characters)
    public var tags: String?
    
    public init(name: String? = nil, description: String? = nil, tags: String? = nil) {
        self.name = name
        self.description = description
        self.tags = tags
    }
    
    public static func modifying(name: String? = nil,
                                 description: String? = nil,
                                 tags: String? = nil) -> Self {
        Self(name: name,
             description: description,
             tags: tags)
    }
}
