//
//  File.swift
//
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

struct Connection {
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
    public var friend_sync: Bool
    
    /// whether activities related to this connection will be shown in presence updates
    public var show_activity: Bool
    
    /// whether this connection has a corresponding third party OAuth2 token
    public var two_way_link: Bool
    
    /// visibility of this connection
    public var visibility: Bool
}
