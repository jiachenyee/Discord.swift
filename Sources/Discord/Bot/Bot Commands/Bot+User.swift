//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getCurrentUser() async throws -> User {
        try await sendRequest(User.self,
                              endpoint: "users/@me")
    }
    
    func getUser(_ userId: Snowflake) async throws -> User {
        try await sendRequest(User.self,
                              endpoint: "users/\(userId)")
    }
}
