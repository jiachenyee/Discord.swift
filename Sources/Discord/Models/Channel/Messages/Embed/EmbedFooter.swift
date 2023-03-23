//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct EmbedFooter: Codable {
    /// footer text
    public var text: String
    
    /// url of footer icon (only supports http(s) and attachments)
    public var iconURL: String?
    
    /// a proxied url of footer icon
    public var proxyIconURL: String?
    
    enum CodingKeys: String, CodingKey {
        case text = "text"
        case iconURL = "icon_url"
        case proxyIconURL = "proxy_icon_url"
    }
    
    public init(text: String, iconURL: String? = nil, proxyIconURL: String? = nil) {
        self.text = text
        self.iconURL = iconURL
        self.proxyIconURL = proxyIconURL
    }
    
    static func footer(text: String,
                       iconURL: String? = nil,
                       proxyIconURL: String? = nil) -> Self {
        Self(text: text,
             iconURL: iconURL,
             proxyIconURL: proxyIconURL)
    }
}
