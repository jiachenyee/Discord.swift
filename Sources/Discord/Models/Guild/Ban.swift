//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct Ban: Codable {
    /// the reason for the ban
    var reason: String?
    
    /// the banned user
    var user: User
}
