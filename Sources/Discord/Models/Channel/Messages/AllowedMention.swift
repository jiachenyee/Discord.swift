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
    public var replied_user: Bool = false
    
    public init(parse: [AllowedMentionType], roles: [Snowflake], users: [Snowflake], replied_user: Bool) {
        self.parse = parse
        self.roles = roles
        self.users = users
        self.replied_user = replied_user
    }
}
