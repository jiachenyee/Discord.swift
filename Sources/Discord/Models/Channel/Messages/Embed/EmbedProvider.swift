//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct EmbedProvider: Codable {
    
    /// name of provider
    public var name: String?
    
    /// url of provider
    public var url: String?
    
    public init(name: String? = nil, url: String? = nil) {
        self.name = name
        self.url = url
    }
    
    public static func provider(name: String? = nil,
                                url: String? = nil) -> EmbedProvider {
        Self(name: name,
             url: url)
    }
}
