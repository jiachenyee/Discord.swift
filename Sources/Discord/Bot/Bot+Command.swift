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
    
    func getCommandsPermissions(in guildId: Snowflake) async throws -> [Command.Permissions] {
        try await sendRequest([Command.Permissions].self,
                              endpoint: "/applications/\(applicationId)/guilds/\(guildId)/commands/permissions",
                              method: .get)
    }
    
    func getCommandPermissions(forCommand commandId: Snowflake,
                               in guildId: Snowflake) async throws -> Command.Permissions {
        try await sendRequest(Command.Permissions.self,
                              endpoint: "/applications/\(applicationId)/guilds/\(guildId)/commands/\(commandId)/permissions",
                              method: .get)
    }
    
    func getAllCommands(type: CommandType = .application) async throws -> [Command] {
        switch type {
        case .application:
            return try await sendRequest([Command].self,
                                         endpoint: "/applications/\(applicationId)/commands",
                                         method: .get)
        case .guild(let guildId):
            return try await sendRequest([Command].self,
                                         endpoint: "/applications/\(applicationId)/guilds/\(guildId)/commands",
                                         method: .get)
        }
    }
    
    func getCommand(type: CommandType = .application, _ commandId: Snowflake) async throws -> Command {
        switch type {
        case .application:
            return try await sendRequest(Command.self,
                                         endpoint: "/applications/\(applicationId)/commands/\(commandId)",
                                         method: .get)
        case .guild(let guildId):
            return try await sendRequest(Command.self,
                                         endpoint: "/applications/\(applicationId)/guilds/\(guildId)/commands/\(commandId)",
                                         method: .get)
        }
        
    }
    
    func bulkOverwriteCommands(type: CommandType = .application, _ commands: [Command]) async throws -> [Command] {
        switch type {
        case .application:
            return try await sendRequest([Command].self,
                                         endpoint: "/applications/\(applicationId)/commands",
                                         method: .put)
        case .guild(let guildId):
            return try await sendRequest([Command].self,
                                         endpoint: "/applications/\(applicationId)/guilds/\(guildId)/commands",
                                         method: .put)
        }
    }
    
    enum CommandType {
        case application
        case guild(Snowflake)
    }
}
