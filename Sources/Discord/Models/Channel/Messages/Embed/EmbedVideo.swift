//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct EmbedVideo: Codable {
    /// source url of video
    public var url: String?
    
    /// a proxied url of the video
    public var proxyURL: String?
    
    /// height of video
    public var height: Int?
    
    /// width of video
    public var width: Int?
    
    enum CodingKeys: String, CodingKey {
        case url = "url"
        case proxyURL = "proxy_url"
        case height = "height"
        case width = "width"
    }
    
    public init(url: String? = nil, proxyURL: String? = nil, height: Int? = nil, width: Int? = nil) {
        self.url = url
        self.proxyURL = proxyURL
        self.height = height
        self.width = width
    }
    
    public static func video(url: String? = nil,
                             proxyURL: String? = nil,
                             height: Int? = nil,
                             width: Int? = nil) -> Self {
        Self(url: url,
             proxyURL: proxyURL,
             height: height,
             width: width)
    }
}
