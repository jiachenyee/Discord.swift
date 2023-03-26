//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation

public extension Bot {
    @discardableResult
    /// Create a new global command.
    /// - Parameter command: The specifications of your command.
    /// - Warning: Creating a command with the same name as an existing command for your application will overwrite the old command.
    /// - Returns: Returns 201 if a command with the same name does not already exist, or a 200 if it does. Both responses include an application command object.
    /// > Discord Reference: [https://discord.com/developers/docs/interactions/application-commands#create-global-application-command](https://discord.com/developers/docs/interactions/application-commands#create-global-application-command)
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
    
    /// Deletes a global command.
    /// - Parameters:
    ///   - type: The type of command that is to be deleted (application or guild).
    ///   - commandId: The command ID of the target command.
    /// > Discord Reference: [https://discord.com/developers/docs/interactions/application-commands#delete-guild-application-command](https://discord.com/developers/docs/interactions/application-commands#delete-guild-application-command)
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
    
    /// Fetches permissions for all commands for your application in a guild.
    /// - Parameter guildId: The guild ID of the target guild.
    /// - Returns: Returns a guild application command permissions object.
    /// - Tip: Looking for permissions for one specific command? Try  <[doc:getCommandsPermissions](doc:getCommandsPermissions)(in:)>.
    /// > Discord Reference: [https://discord.com/developers/docs/interactions/application-commands#get-guild-application-command-permissions](https://discord.com/developers/docs/interactions/application-commands#get-guild-application-command-permissions)
    func getCommandsPermissions(in guildId: Snowflake) async throws -> [Command.Permissions] {
        try await sendRequest([Command.Permissions].self,
                              endpoint: "/applications/\(applicationId)/guilds/\(guildId)/commands/permissions",
                              method: .get)
    }
    
    /// Fetches permissions for a specific command for your application in a guild.
    /// - Parameters:
    ///   - commandId: The command ID of the target command.
    ///   - guildId: The guild ID of the target guild.
    /// - Returns: Returns a guild application command permissions object.
    /// > Discord Reference: [https://discord.com/developers/docs/interactions/application-commands#get-application-command-permissions](https://discord.com/developers/docs/interactions/application-commands#get-application-command-permissions)
    func getCommandPermissions(forCommand commandId: Snowflake,
                               in guildId: Snowflake) async throws -> Command.Permissions {
        try await sendRequest(Command.Permissions.self,
                              endpoint: "/applications/\(applicationId)/guilds/\(guildId)/commands/\(commandId)/permissions",
                              method: .get)
    }
    
    /// Fetch all of the guild commands for your application for a specific guild.
    /// - Parameter type: The type of command that will be returned (application or guild).
    /// - Returns: Returns an array of application command objects.
    /// - Important:
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
    
    /// Fetch a global command for your application.
    /// - Parameters:
    ///   - type: The type of command that will be returned (application or guild).
    ///   - commandId: The command ID of the target command.
    /// - Returns: Returns an application command object.
    /// > Discord Reference: [https://discord.com/developers/docs/interactions/application-commands#get-global-application-command](https://discord.com/developers/docs/interactions/application-commands#get-global-application-command)
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
    
    /// Takes a list of application commands, overwriting the existing global command list for this application.
    /// - Parameters:
    ///   - type: The type of commands to overwrite.
    ///   - commands: The list of application commands to overwrite.
    /// - Returns: Returns 200 and a list of application command objects.
    /// - Important: Commands that do not already exist will count toward daily application command create limits.
    /// - Warning: This will overwrite all types of application commands: slash commands, user commands, and message commands.
    /// > Discord Reference: [https://discord.com/developers/docs/interactions/application-commands#bulk-overwrite-global-application-commands](https://discord.com/developers/docs/interactions/application-commands#bulk-overwrite-global-application-commands)
    @discardableResult
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
