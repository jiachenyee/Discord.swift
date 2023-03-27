//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public extension Bot {
    func createInteractionResponse(interaction interactionId: Snowflake,
                                   token: String,
                                   interactionResponse: InteractionResponse) async throws {
        try await sendRequest(endpoint: "interactions/\(interactionId)/\(token)/callback",
                              method: .post,
                              data: interactionResponse)
    }
    
    func getOriginalInteractionResponse(token: String) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "webhooks/\(applicationId)/\(token)/messages/@original")
    }
    
    func deleteOriginalInteractionResponse(token: String) async throws {
        try await sendRequest(endpoint: "webhooks/\(applicationId)/\(token)/messages/@original",
                              method: .delete)
    }
}
