//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    /// Creates a new Stage instance associated to a Stage channel.
    /// - Important: Requires the user to be a moderator of the Stage channel.
    /// - Parameter stageInstance: New Stage Instance information
    /// - Returns: Returns `Stage` instance. Fires a Stage Instance Create Gateway event.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/stage-instance#create-stage-instance](https://discord.com/developers/docs/resources/stage-instance#create-stage-instance)
    @discardableResult
    func createStageInstance(_ stageInstance: NewStageInstance,
                             reason: String? = nil) async throws -> StageInstance {
        try await sendRequest(StageInstance.self,
                              endpoint: "stage-instances",
                              method: .post,
                              data: stageInstance,
                              reason: reason)
    }
    
    /// Gets the stage instance associated with the Stage channel, if it exists.
    /// - Parameter channelId: Stage channel ID
    /// - Returns: Returns `StageInstance` object
    /// > Discord Reference: [https://discord.com/developers/docs/resources/stage-instance#get-stage-instance](https://discord.com/developers/docs/resources/stage-instance#get-stage-instance)
    func getStageInstance(channel channelId: Snowflake) async throws -> StageInstance {
        try await sendRequest(StageInstance.self,
                              endpoint: "stage-instances/\(channelId)")
    }
    
    /// Updates fields of an existing Stage instance.
    /// - Important: Requires the user to be a moderator of the Stage channel.
    /// - Parameters:
    ///   - channelId: Stage channel ID
    ///   - modifications: Modifications to apply to the stage instance
    /// - Returns: Returns the updated Stage instance. Fires a Stage Instance Update Gateway event.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/stage-instance#modify-stage-instance](https://discord.com/developers/docs/resources/stage-instance#modify-stage-instance)
    @discardableResult
    func modifyStageInstance(channel channelId: Snowflake,
                             modifications: ModifyStageInstanceRequest,
                             reason: String? = nil) async throws -> StageInstance {
        try await sendRequest(StageInstance.self,
                              endpoint: "stage-instances/\(channelId)",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    /// Deletes the Stage instance.
    ///
    /// Fires a Stage Instance Delete Gateway event.
    /// - Parameter channelId: Stage channel ID
    /// > Discord Reference: [https://discord.com/developers/docs/resources/stage-instance#delete-stage-instance](https://discord.com/developers/docs/resources/stage-instance#delete-stage-instance)
    func deleteStageInstance(channel channelId: Snowflake,
                             reason: String? = nil) async throws {
        try await sendRequest(endpoint: "stage-instances/\(channelId)",
                              method: .delete, reason: reason)
    }
}
