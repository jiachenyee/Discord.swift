//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public struct TeamMember: Codable {
    /// the user's membership state on the team
    public var membershipState: MembershipState
    
    /// will always be `["*"]`
    public var permissions: [String]
    
    /// the id of the parent team of which they are a member
    public var teamId: Snowflake
    
    /// the avatar, discriminator, id, and username of the user
    public var user: User
    
    enum CodingKeys: String, CodingKey {
        case membershipState = "membership_state"
        case permissions = "permissions"
        case teamId = "team_id"
        case user = "user"
    }
}
