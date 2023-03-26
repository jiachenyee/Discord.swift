//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct CreateWebhookRequest: Codable {
    /// name of the webhook (1-80 characters)
    public var name: String
    /// image for the default webhook avatar
    public var avatar: Data?
    
    public init(name: String, avatar: Data? = nil) {
        self.name = name
        self.avatar = avatar
    }
    
    public static func create(name: String, avatar: Data? = nil) -> Self {
        Self(name: name,
             avatar: avatar)
    }
}
