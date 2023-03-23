//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

struct Emoji {
    /// emoji id
    var id: Snowflake?
    
    /// emoji name
    var name: String?
    
    #warning("incomplete implementation")
//    var roles: array of role object ids    roles allowed to use this emoji
    
    /// user that created this emoji
    var user: User?
    
    /// whether this emoji must be wrapped in colons
    var require_colons: Bool?
    
    /// whether this emoji is managed
    var managed: Bool?
    
    /// whether this emoji is animated
    var animated: Bool?
    
    /// whether this emoji can be used, may be false due to loss of Server Boosts
    var available: Bool?
}
