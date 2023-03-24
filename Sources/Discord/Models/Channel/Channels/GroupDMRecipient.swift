//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GroupDMRecipient: Codable {
    /// access token of a user that has granted your app the gdm.join scope
    public var accessToken: String
    
    /// nickname of the user being added
    public var nick: String
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case nick = "nick"
    }
    
    init(accessToken: String, nick: String) {
        self.accessToken = accessToken
        self.nick = nick
    }
}
