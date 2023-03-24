//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum ExplicitContentFilterLevel: Int, Codable {
    /// media content will not be scanned
    case disabled = 0
    /// media content sent by members without roles will be scanned
    case membersWithoutRoles = 1
    /// media content sent by all members will be scanned
    case allMembers = 2
}
