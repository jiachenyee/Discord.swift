//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation

public class Bot {
    var applicationId: String
    var token: String
    
    var presence: Presence
    var intents: Intents
    
    var gatewayManager: GatewayManager!
    
    public init(applicationId: String, token: String, presence: Presence, intents: Intents) {
        self.applicationId = applicationId
        self.token = token
        self.presence = presence
        self.intents = intents
    }
    
    @discardableResult
    public func connect() -> Bot {
        gatewayManager = GatewayManager(bot: self)
        gatewayManager.connect()
        return self
    }
}
