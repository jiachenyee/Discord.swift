//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct Ban: Codable {
    /// the reason for the ban
    public var reason: String?
    
    /// the banned user
    public var user: User
    
    public init(reason: String? = nil, user: User) {
        self.reason = reason
        self.user = user
    }
}
