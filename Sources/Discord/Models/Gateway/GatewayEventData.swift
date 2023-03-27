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
        guard let jsonData = try? JSONSerialization.data(withJSONObject: data),
              let value = try? decoder.decode(Self.self, from: jsonData) else { fatalError("Could not decode/encode") }
        
        return value
    }
}
