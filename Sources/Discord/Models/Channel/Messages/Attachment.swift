//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct Attachment: Codable {
    /// attachment id
    public var id: Snowflake
    
    /// name of file attached
    public var filename: String
    
    /// description for the file (max 1024 characters)
    public var description: String?
    
    /// the attachment's media type
    public var contentType: String?
    
    /// size of file in bytes
    public var size: Int
    
    /// source url of file
    public var url: String
    
    /// a proxied url of file
    public var proxyURL: String
    
    /// height of file (if image)
    public var height: Int?
    
    /// width of file (if image)
    public var width: Int?
    
    /// whether this attachment is ephemeral
    public var ephemeral: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case filename = "filename"
        case description = "description"
        case contentType = "content_type"
        case size = "size"
        case url = "url"
        case proxyURL = "proxy_url"
        case height = "height"
        case width = "width"
        case ephemeral = "ephemeral"
    }
    
    public init(id: Snowflake, filename: String, description: String? = nil, contentType: String? = nil, size: Int, url: String, proxyURL: String, height: Int? = nil, width: Int? = nil, ephemeral: Bool? = nil) {
        self.id = id
        self.filename = filename
        self.description = description
        self.contentType = contentType
        self.size = size
        self.url = url
        self.proxyURL = proxyURL
        self.height = height
        self.width = width
        self.ephemeral = ephemeral
    }
}
