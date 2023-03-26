//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct InstallParams: Codable {
    /// the scopes to add the application to the server with
    public var scopes: [String]
    
    /// the permissions to request for the bot role
    public var permissions: Permissions
}
