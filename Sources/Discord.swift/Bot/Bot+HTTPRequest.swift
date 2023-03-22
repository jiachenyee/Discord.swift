//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation
import Alamofire

public extension Bot {
    @discardableResult
    internal func sendRequest(endpoint: String,
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
    
    @discardableResult
    internal func sendRequest<T: Encodable>(endpoint: String,
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
    
    internal func sendRequest<T: Encodable, D: Decodable>(_ type: D.Type,
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