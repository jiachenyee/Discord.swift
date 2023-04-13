//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public struct GatewayResume: Codable {
    var operation = GatewayOpCode.resume
    var data: ResumePayload
    
    enum CodingKeys: String, CodingKey {
        case operation = "op"
        case data = "d"
    }
}

public struct ResumePayload: GatewayEventData {
    /// Session token
    public var token: String?
    
    /// Session ID
    public var sessionId: String?
    
    /// Last sequence number received
    public var sequence: Int?
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
        case sessionId = "session_id"
        case sequence = "seq"
    }
}
