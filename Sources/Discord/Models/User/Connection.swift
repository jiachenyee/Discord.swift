//
//  File.swift
//
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct Connection: Codable {
    /// id of the connection account
    public var id: String
    
    /// the username of the connection account
    public var name: String
    
    /// the service of this connection
    public var type: ConnectionService
    
    /// whether the connection is revoked
    public var revoked: Bool?
    
    /// an array of partial server integrations
    public var integrations: [Integration]?
    
    /// whether the connection is verified
    public var verified: Bool
    
    /// whether friend sync is enabled for this connection
    public var friendSync: Bool
    
    /// whether activities related to this connection will be shown in presence updates
    public var showActivity: Bool
    
    /// whether this connection has a corresponding third party OAuth2 token
    public var twoWayLink: Bool
    
    /// visibility of this connection
    public var visibility: Bool
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case revoked = "revoked"
        case integrations = "integrations"
        case verified = "verified"
        case friendSync = "friend_sync"
        case showActivity = "show_activity"
        case twoWayLink = "two_way_link"
        case visibility = "visibility"
    }
}
