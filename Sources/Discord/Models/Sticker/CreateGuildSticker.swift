//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct CreateGuildSticker: Codable {
    /// name of the sticker (2-30 characters)
    public var name: String
    
    /// description of the sticker (empty or 2-100 characters)
    public var description: String
    
    /// autocomplete/suggestion tags for the sticker (max 200 characters)
    public var tags: String
    
    /// the sticker file to upload, must be a PNG, APNG, GIF, or Lottie JSON file, max 512 KB
    public var file: Data
    
    public init(name: String, description: String, tags: String, file: Data) {
        self.name = name
        self.description = description
        self.tags = tags
        self.file = file
    }
}
