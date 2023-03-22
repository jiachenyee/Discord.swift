//
//  ApplicationCommandValue.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public extension ApplicationCommand {
    struct Value: Codable {
        var stringValue: String?
        var doubleValue: Double?
        var intValue: Int?
        
        public static func string(_ value: String) -> Self {
            Self(value)
        }
        
        public static func int(_ value: Int) -> Self {
            Self(value)
        }
        
        public static func double(_ value: Double) -> Self {
            Self(value)
        }
        
        public init(_ value: String) {
            self.stringValue = value
        }
        
        public init(_ value: Double) {
            self.doubleValue = value
        }
        
        public init(_ value: Int) {
            self.intValue = value
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            
            if let stringValue {
                try container.encode(stringValue)
            } else if let doubleValue {
                try container.encode(doubleValue)
            } else if let intValue {
                try container.encode(intValue)
            }
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            
            self.stringValue = try? container.decode(String.self)
            self.doubleValue = try? container.decode(Double.self)
            self.intValue = try? container.decode(Int.self)
        }
    }
}
