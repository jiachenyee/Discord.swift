//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func createStageInstance(_ stageInstance: NewStageInstance) async throws -> StageInstance {
        try await sendRequest(StageInstance.self,
                              endpoint: "stage-instances",
                              method: .post,
                              data: stageInstance)
    }
    
    func getStageInstance(channel channelId: Snowflake) async throws -> StageInstance {
        try await sendRequest(StageInstance.self,
                              endpoint: "stage-instances/\(channelId)")
    }
    
    func modifyStageInstance(channel channelId: Snowflake,
                             modifications: ModifyStageInstanceRequest) async throws -> StageInstance {
        try await sendRequest(StageInstance.self,
                              endpoint: "stage-instances/\(channelId)",
                              method: .patch,
                              data: modifications)
    }
    
    func deleteStageInstance(channel channelId: Snowflake) async throws {
        try await sendRequest(endpoint: "stage-instances/\(channelId)",
                              method: .delete)
    }
}
