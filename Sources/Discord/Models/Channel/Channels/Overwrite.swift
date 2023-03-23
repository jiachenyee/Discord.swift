//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Overwrite: Codable {
    /// role or user id
    var id: Snowflake
    
    /// either 0 (role) or 1 (member)
    var type: Int
    
    /// permission bit set
    var allow: Permissions
    
    /// permission bit set
    var deny: Permissions
}
