//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct ISO8601Timestamp: Codable {
    public var date: Date
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        try container.encode(date.ISO8601Format())
    }
    
    enum CodingKeys: CodingKey {
        case date
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try container.decode(String.self)
        
        self.date = try Date(rawValue, strategy: .iso8601)
    }
}
