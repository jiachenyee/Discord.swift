//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ApplicationRoleConnection {
    /// the vanity name of the platform a bot has connected (max 50 characters)
    public var platform_name: String?
    
    /// the username on the platform a bot has connected (max 100 characters)
    public var platform_username: String?
    
    /// object mapping application role connection metadata keys to their string-ified value (max 100 characters) for the user on the platform a bot has connected
//    public var metadata    object
    #warning("Incomplete implementation")
}
