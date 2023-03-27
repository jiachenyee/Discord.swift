//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct Embed: Codable {
    /// title of embed
    public var title: String?
    
    /// type of embed (always "rich" for webhook embeds)
    public var type: EmbedType? = .rich
    
    /// description of embed
    public var description: String?
    
    /// url of embed
    public var url: String?
    
    /// timestamp of embed content
    public var timestamp: ISO8601Timestamp?
    
    /// color code of the embed
    public var color: Int?
    
    /// footer information
    public var footer: EmbedFooter?
    
    /// image information
    public var image: EmbedImage?
    
    /// thumbnail information
    public var thumbnail: EmbedThumbnail?
    
    /// video information
    public var video: EmbedVideo?
    
    /// provider information
    public var provider: EmbedProvider?
    
    /// author information
    public var author: EmbedAuthor?
    
    /// fields information
    public var fields: [EmbedField]?
    
    init(title: String? = nil,
         type: EmbedType? = .rich,
         description: String? = nil,
         url: String? = nil,
         timestamp: ISO8601Timestamp? = nil,
         color: Int? = nil,
         footer: EmbedFooter? = nil,
         image: EmbedImage? = nil,
         thumbnail: EmbedThumbnail? = nil,
         video: EmbedVideo? = nil,
         provider: EmbedProvider? = nil,
         author: EmbedAuthor? = nil,
         fields: [EmbedField]? = nil) {
        self.title = title
        self.type = type
        self.description = description
        self.url = url
        self.timestamp = timestamp
        self.color = color
        self.footer = footer
        self.image = image
        self.thumbnail = thumbnail
        self.video = video
        self.provider = provider
        self.author = author
        self.fields = fields
    }
    
    public static func embed(title: String? = nil,
                             description: String? = nil,
                             url: String? = nil,
                             timestamp: ISO8601Timestamp? = nil,
                             color: Int? = nil,
                             footer: EmbedFooter? = nil,
                             image: EmbedImage? = nil,
                             thumbnail: EmbedThumbnail? = nil,
                             video: EmbedVideo? = nil,
                             provider: EmbedProvider? = nil,
                             author: EmbedAuthor? = nil,
                             fields: [EmbedField]? = nil) -> Self {
        Self(title: title,
             description: description,
             url: url,
             timestamp: timestamp,
             color: color,
             footer: footer,
             image: image,
             thumbnail: thumbnail,
             video: video,
             provider: provider,
             author: author,
             fields: fields)
    }
}
