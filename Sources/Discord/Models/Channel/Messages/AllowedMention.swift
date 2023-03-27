//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct AllowedMention: Codable {
    /// An array of allowed mention types to parse from the content.
    public var parse: [AllowedMentionType]
    
    /// Array of role_ids to mention (Max size of 100)
    public var roles: [Snowflake]
    
    /// Array of user_ids to mention (Max size of 100)
    public var users: [Snowflake]
    
    /// For replies, whether to mention the author of the message being replied to (default false)
    public var repliedUser: Bool = false
    
    public init(parse: [AllowedMentionType], roles: [Snowflake], users: [Snowflake], repliedUser: Bool) {
        self.parse = parse
        self.roles = roles
        self.users = users
        self.repliedUser = repliedUser
    }
    
    enum CodingKeys: String, CodingKey {
        case parse = "parse"
        case roles = "roles"
        case users = "users"
        case repliedUser = "replied_user"
    }
}
