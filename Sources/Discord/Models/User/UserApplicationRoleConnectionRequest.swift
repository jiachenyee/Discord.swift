//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct UserApplicationRoleConnectionRequest: Codable {
    /// the vanity name of the platform a bot has connected (max 50 characters)
    public var platformName: String?
    
    /// the username on the platform a bot has connected (max 100 characters)
    public var platformUsername: String?
    
    /// object mapping application role connection metadata keys to their string-ified value (max 100 characters) for the user on the platform a bot has connected
    public var metadata: ApplicationRoleConnectionMetadata?
    
    enum CodingKeys: String, CodingKey {
        case platformName = "platform_name"
        case platformUsername = "platform_username"
        case metadata = "metadata"
    }
}
