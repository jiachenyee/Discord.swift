//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum AllowedMentionType: String, Codable {
    /// Controls role mentions
    case roles = "roles"
    
    /// Controls user mentions
    case users = "users"
    
    /// Controls @everyone and @here mentions
    case everyone = "everyone"
}
