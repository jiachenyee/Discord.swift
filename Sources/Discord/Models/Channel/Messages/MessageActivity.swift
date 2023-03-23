//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct MessageActivity: Codable {
    /// type of message activity
    public var type: MessageActivityType
    
    /// party_id from a Rich Presence event
    public var partyId: String?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case partyId = "party_id"
    }
    
    public init(type: MessageActivityType, partyId: String? = nil) {
        self.type = type
        self.partyId = partyId
    }
}
