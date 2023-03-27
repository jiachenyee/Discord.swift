//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public struct Team: Codable {
    /// a hash of the image of the team's icon
    public var icon: String?
    
    /// the unique id of the team
    public var id: Snowflake
    
    /// the members of the team
    public var members: [TeamMember]
    
    /// the name of the team
    public var name: String
    
    /// the user id of the current team owner
    public var ownerUserId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case icon = "icon"
        case id = "id"
        case members = "members"
        case name = "name"
        case ownerUserId = "owner_user_id"
    }
}
