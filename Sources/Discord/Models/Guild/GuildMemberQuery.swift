//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildMemberQuery: Parameterable {
    /// Query string to match username(s) and nickname(s) against.
    public var query: String
    
    /// max number of members to return (1-1000)
    public var limit: Int?
    
    public init(query: String, limit: Int? = nil) {
        self.query = query
        self.limit = limit
    }
}
