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
    
    @discardableResult public func createApplicationCommand(_ command: ApplicationCommand) async throws -> Data {
        try await createDiscordRequest(endpoint: "applications/\(applicationId)/commands",
                                   method: .post,
                                   data: command)
    }
    
    public func createDiscordRequest<T: Encodable>(endpoint: String,
                                                   method: HTTPMethod,
                                                   data: T) async throws -> Data {
        let request = AF.request("https://discord.com/api/v10/\(endpoint)",
                                    method: method,
                                    parameters: data,
                                    encoder: .json,
                                    headers: [
                                        .authorization("Bot \(token)")
                                    ])
        
        let value = try await request.serializingData().value
        
        return value
    }
}
