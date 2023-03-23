//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct EmbedAuthor: Codable {
    /// name of author
    public var name: String
    
    /// url of author (only supports http(s))
    public var url: String?
    
    /// url of author icon (only supports http(s) and attachments)
    public var iconURL: String?
    
    /// a proxied url of author icon
    public var proxyIconURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case url = "url"
        case iconURL = "icon_url"
        case proxyIconURL = "proxy_icon_url"
    }
    
    public init(name: String, url: String? = nil, iconURL: String? = nil, proxyIconURL: String? = nil) {
        self.name = name
        self.url = url
        self.iconURL = iconURL
        self.proxyIconURL = proxyIconURL
    }
    
    public static func author(name: String,
                              url: String? = nil,
                              iconURL: String? = nil,
                              proxyIconURL: String? = nil) -> Self {
        Self(name: name,
             url: url,
             iconURL: iconURL,
             proxyIconURL: proxyIconURL)
    }
}
