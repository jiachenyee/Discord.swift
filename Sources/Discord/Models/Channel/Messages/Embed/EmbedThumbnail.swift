//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct EmbedThumbnail: Codable {
    /// source url of thumbnail (only supports http(s) and attachments)
    public var url: String
    
    /// a proxied url of the thumbnail
    public var proxyURL: String?
    
    /// height of thumbnail
    public var height: Int?
    
    /// width of thumbnail
    public var width: Int?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case proxyURL = "proxy_url"
        case height = "height"
        case width = "width"
    }
    
    public init(url: String, proxyURL: String? = nil, height: Int? = nil, width: Int? = nil) {
        self.url = url
        self.proxyURL = proxyURL
        self.height = height
        self.width = width
    }
    
    public static func thumbnail(url: String,
                                 proxyURL: String? = nil,
                                 height: Int? = nil,
                                 width: Int? = nil) -> Self {
        Self(url: url,
             proxyURL: proxyURL,
             height: height,
             width: width)
    }
}
