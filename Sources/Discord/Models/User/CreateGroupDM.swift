//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct CreateGroupDM: Codable {
    /// access tokens of users that have granted your app the gdm.join scope
    public var accessTokens: [String]
    
    /// a dictionary of user ids to their respective nicknames
    public var nicks: [Snowflake: String]
    
    enum CodingKeys: String, CodingKey {
        case accessTokens = "access_tokens"
        case nicks = "nicks"
    }
    
    public init(accessTokens: [String], nicks: [Snowflake: String]) {
        self.accessTokens = accessTokens
        self.nicks = nicks
    }
    
    public static func create(accessTokens: [String],
                              nicks: [Snowflake: String]) -> Self {
        Self(accessTokens: accessTokens,
             nicks: nicks)
    }
}
