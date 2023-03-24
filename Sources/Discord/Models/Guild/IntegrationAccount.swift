//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct IntegrationAccount: Codable {
    /// id of the account
    public var id: String
    
    /// name of the account
    public var name: String
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}
