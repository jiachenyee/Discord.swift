//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public extension Bot {
    func createInteractionResponse(id interactionId: Snowflake,
                                   token: String,
                                   interactionResponse: InteractionResponse) async throws {
        try await sendRequest(endpoint: "interactions/\(interactionId)/\(token)/callback",
                              method: .post,
                              data: interactionResponse)
    }
    
    func createInteractionResponse(interaction: Interaction,
                                   response: InteractionResponse) async throws {
        try await sendRequest(endpoint: "interactions/\(interaction.id)/\(interaction.token!)/callback",
                              method: .post,
                              data: response)
    }
    
    func getOriginalInteractionResponse(token: String) async throws -> InteractionResponse {
        try await sendRequest(InteractionResponse.self,
                              endpoint: "webhooks/\(applicationId)/\(token)/messages/@original")
    }
    
    func editOriginalInteractionResponse(token: String,
                                         response: InteractionResponse) async throws -> InteractionResponse {
        try await sendRequest(InteractionResponse.self,
                              endpoint: "webhooks/\(applicationId)/\(token)/messages/@original",
                              method: .patch,
                              data: response)
    }
    
    func deleteOriginalInteractionResponse(token: String) async throws {
        try await sendRequest(endpoint: "webhooks/\(applicationId)/\(token)/messages/@original",
                              method: .delete)
    }
    
    func createFollowupMessage(token: String,
                               message: FollowupMessage) async throws {
        try await sendRequest(endpoint: "interactions/\(applicationId)/\(token)",
                              method: .post,
                              data: message)
    }
    
    func getFollowupMessage(token: String,
                            message messageId: Snowflake) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "interactions/\(applicationId)/\(token)/messages/\(messageId)")
    }
    
    func deleteFollowupMessage(token: String,
                               message messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "interactions/\(applicationId)/\(token)/messages/\(messageId)",
                              method: .delete)
    }
}
