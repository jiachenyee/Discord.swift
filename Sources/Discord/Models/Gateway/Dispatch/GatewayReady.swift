//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayReady: GatewayEventData {
    /// API version
    public var version: Int
    /// Information about the user including email
    public var user: User
    /// Guilds the user is in
    public var guilds: [UnavailableGuild]
    /// Used for resuming connections
    public var sessionId: String
    /// Gateway URL for resuming connections
    public var resumeGatewayURL: String
    /// Shard information associated with this session, if sent when identifying
    public var shard: [Int]?
    /// Contains id and flags
    public var application: PartialApplication
    
    enum CodingKeys: String, CodingKey {
        case version = "v"
        case user = "user"
        case guilds = "guilds"
        case sessionId = "session_id"
        case resumeGatewayURL = "resume_gateway_url"
        case shard = "shard"
        case application = "application"
    }
}
