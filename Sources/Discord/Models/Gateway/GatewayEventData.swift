//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public protocol GatewayEventData: Codable {
    static func decode(_ data: Any) -> Self
}

public extension GatewayEventData {
    static func decode(_ data: Any) -> Self {
        let decoder = JSONDecoder()
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data) else { fatalError("Could not decode/encode") }
        
        do {
            let value = try decoder.decode(Self.self, from: jsonData)
            return value
        } catch {
            print(jsonData)
            
            fatalError("Decoding error: \(error.localizedDescription)")
        }
    }
}
