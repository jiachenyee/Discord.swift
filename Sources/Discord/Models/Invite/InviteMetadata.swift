//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct InviteMetadata: Codable {
    /// number of times this invite has been used
    public var uses: Int
    
    /// max number of times this invite can be used
    public var maxUses: Int
    
    /// duration (in seconds) after which the invite expires
    public var maxAge: Int
    
    /// whether this invite only grants temporary membership
    public var temporary: Bool
    
    /// when this invite was created
    public var createdAt: ISO8601Timestamp
    
    enum CodingKeys: String, CodingKey {
        case uses = "uses"
        case maxUses = "max_uses"
        case maxAge = "max_age"
        case temporary = "temporary"
        case createdAt = "created_at"
    }
}
