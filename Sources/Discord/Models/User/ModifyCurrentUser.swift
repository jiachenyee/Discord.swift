//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ModifyCurrentUser: Codable {
    /// user's username, if changed may cause the user's discriminator to be randomized.
    public var username: String?
    
    /// if passed, modifies the user's avatar
    public var avatar: Data?
    
    public init(username: String? = nil, avatar: Data? = nil) {
        self.username = username
        self.avatar = avatar
    }
    
    public static func modifying(username: String? = nil,
                                 avatar: Data? = nil) -> Self {
        Self(username: username,
             avatar: avatar)
    }
}
