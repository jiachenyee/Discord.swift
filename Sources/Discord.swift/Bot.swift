//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation
import Alamofire

public class Bot {
    var applicationId: String
    var token: String
    
    public init(applicationId: String, token: String) {
        self.applicationId = applicationId
        self.token = token
    }
    
    @discardableResult
    public func createCommand(_ command: Command) async throws -> Command {
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
    
    @discardableResult
    public func deleteApplicationCommand(_ commandId: Snowflake) async throws -> Data {
        try await sendRequest(endpoint: "applications/\(applicationId)/commands/\(commandId.stringValue)",
                              method: .delete)
    }
    
    public func sendRequest(endpoint: String,
                            method: HTTPMethod) async throws -> Data {
        let request = AF.request("https://discord.com/api/v10/\(endpoint)",
                                 method: method,
                                 headers: [
                                    .authorization("Bot \(token)"),
                                    .userAgent("DiscordBot (https://github.com/jiachenyee/Discord.swift, 0)")
                                 ])
        
        let value = try await request.serializingData().value
        
        return value
    }
    
    public func sendRequest<T: Encodable>(endpoint: String,
                                          method: HTTPMethod,
                                          data: T) async throws -> Data {
        let request = AF.request("https://discord.com/api/v10/\(endpoint)",
                                 method: method,
                                 parameters: data,
                                 encoder: .json,
                                 headers: [
                                    .authorization("Bot \(token)"),
                                    .userAgent("DiscordBot (https://github.com/jiachenyee/Discord.swift, 0)")
                                 ])
        
        let value = try await request.serializingData().value
        
        return value
    }
    
    public func sendRequest<T: Encodable, D: Decodable>(_ type: D.Type,
                                                        endpoint: String,
                                                        method: HTTPMethod,
                                                        data: T) async throws -> D {
        
        let data = try await sendRequest(endpoint: endpoint, method: method, data: data)
        
        if let decodedValue = try? JSONDecoder().decode(D.self, from: data) {
            return decodedValue
        }
        
        let errorValue = try JSONSerialization.jsonObject(with: data) as? [String: Any]
        
        if let errorValue {
            throw DiscordError.apiError(value: errorValue)
        } else {
            throw DiscordError.unknownError
        }
    }
    
    enum DiscordError: Error {
        case apiError(value: [String: Any])
        case unknownError
    }
}
