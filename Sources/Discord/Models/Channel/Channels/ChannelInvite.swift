//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ChannelInvite: Codable {
    /// duration of invite in seconds before expiry, or 0 for never. between 0 and 604800 (7 days)
    public var maxAge: Int = 86400
    
    /// max number of uses or 0 for unlimited. between 0 and 100
    public var maxUses: Int = 0
    
    /// whether this invite only grants temporary membership
    public var temporary: Bool = false
    
    /// if true, don't try to reuse a similar invite (useful for creating many unique one time use invites)
    public var unique: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case maxAge = "max_age"
        case maxUses = "max_uses"
        case temporary = "temporary"
        case unique = "unique"
    }
    
    public init(maxAge: Int, maxUses: Int, temporary: Bool, unique: Bool) {
        self.maxAge = maxAge
        self.maxUses = maxUses
        self.temporary = temporary
        self.unique = unique
    }
}
