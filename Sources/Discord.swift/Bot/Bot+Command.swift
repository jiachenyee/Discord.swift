//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation

public extension Bot {
    @discardableResult
    func createCommand(_ command: Command) async throws -> Command {
        if let guildId = command.guildId {
            return try await sendRequest(Command.self,
                                         endpoint: "applications/\(applicationId)/guilds/\(guildId)/commands",
                                         method: .post,
                                         data: command)
        } else {
            return try await sendRequest(Command.self,
                                         endpoint: "applications/\(applicationId)/commands",
                                         method: .post,
                                         data: command)
        }
    }
    
    func deleteCommand(type: CommandType = .application, _ commandId: Snowflake) async throws {
        switch type {
        case .application:
            try await sendRequest(endpoint: "applications/\(applicationId)/commands/\(commandId)",
                                  method: .delete)
        case .guild(let guildId):
            try await sendRequest(endpoint: "applications/\(applicationId)/guilds/\(guildId)/commands/\(commandId)",
                                  method: .delete)
        }
    }
    
    enum CommandType {
        case application
        case guild(Snowflake)
    }
}
