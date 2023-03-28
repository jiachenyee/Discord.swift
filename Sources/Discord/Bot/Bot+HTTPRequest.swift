//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation
import Alamofire

public extension Bot {
    fileprivate func getRequest<T: Encodable>(endpoint: String,
                                              method: HTTPMethod,
                                              data: T,
                                              reason: String? = nil) -> DataRequest {
        var headers: HTTPHeaders = [
            .authorization("Bot \(token)"),
            .userAgent("DiscordBot (https://github.com/jiachenyee/Discord.swift, 0)"),
            .contentType("application/json")
        ]
        
        if let reason {
            headers.add(name: "X-Audit-Log-Reason", value: reason)
        }
        
        let endpointURL = "https://discord.com/api/v10/\(endpoint)"
        
        return AF.request(endpointURL,
                          method: method,
                          parameters: data,
                          encoder: .json,
                          headers: headers)
    }
    
    fileprivate func getRequest(endpoint: String,
                                method: HTTPMethod,
                                parameters: Parameters? = nil,
                                reason: String? = nil) -> DataRequest {
        var headers: HTTPHeaders = [
            .authorization("Bot \(token)"),
            .userAgent("DiscordBot (https://github.com/jiachenyee/Discord.swift, 0)"),
            .contentType("application/json")
        ]
        
        if let reason {
            headers.add(name: "X-Audit-Log-Reason", value: reason)
        }
        
        let endpointURL = "https://discord.com/api/v10/\(endpoint)"
        
        if let parameters {
            return AF.request(endpointURL,
                              method: method,
                              parameters: parameters,
                              headers: headers)
        } else {
            return AF.request(endpointURL,
                              method: method,
                              headers: headers)
        }
    }
    
    @discardableResult
    internal func sendRequest(endpoint: String,
                              method: HTTPMethod,
                              reason: String? = nil) async throws -> Data {
        let request = getRequest(endpoint: endpoint,
                                 method: method,
                                 reason: reason)
        
        let value = try await request.serializingData().value
        
        return value
    }
    
    @discardableResult
    internal func sendRequest(endpoint: String,
                              parameters: Parameters? = nil,
                              reason: String? = nil) async throws -> Data {
        
        let request = getRequest(endpoint: endpoint,
                                 method: .get,
                                 parameters: parameters,
                                 reason: reason)
        
        let value = try await request.serializingData().value
        
        return value
    }
    
    @discardableResult
    internal func sendRequest<D: Decodable>(_ type: D.Type,
                                            endpoint: String,
                                            parameters: Parameters? = nil,
                                            reason: String? = nil) async throws -> D {
        let data = try await sendRequest(endpoint: endpoint,
                                         parameters: parameters,
                                         reason: reason)
        
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
    
    @discardableResult
    internal func sendRequest<T: Encodable>(endpoint: String,
                                            method: HTTPMethod,
                                            data: T,
                                            reason: String? = nil) async throws -> Data {
        
        let request = getRequest(endpoint: endpoint, method: method,
                                 data: data,
                                 reason: reason)
        
        let value = try await request.serializingData().value
        
        if value.count != 0 {
            let errorValue = try JSONSerialization.jsonObject(with: value) as? [String: Any]
            
            if let errorValue, errorValue["errors"] != nil {
                throw DiscordError.apiError(value: errorValue)
            }
        }
        
        return value
    }
    
    internal func sendRequest<T: Encodable, D: Decodable>(_ type: D.Type,
                                                          endpoint: String,
                                                          method: HTTPMethod,
                                                          data: T,
                                                          reason: String? = nil) async throws -> D {
        
        let data = try await sendRequest(endpoint: endpoint,
                                         method: method,
                                         data: data,
                                         reason: reason)
        
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
    
    internal func sendRequest<D: Decodable>(_ type: D.Type,
                                            endpoint: String,
                                            method: HTTPMethod,
                                            reason: String? = nil) async throws -> D {
        
        let data = try await sendRequest(endpoint: endpoint, method: method,
                                         reason: reason)
        
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
