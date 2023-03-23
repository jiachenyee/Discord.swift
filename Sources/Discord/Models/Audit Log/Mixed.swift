//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Mixed: Codable {
    public var rawValue: Any
    
    public var intValue: Int? {
        get {
            rawValue as? Int
        }
        set {
            if let newValue {
                rawValue = newValue
            }
        }
    }
    
    public var doubleValue: Double? {
        get {
            rawValue as? Double
        }
        set {
            if let newValue {
                rawValue = newValue
            }
        }
    }
    
    public var stringValue: String? {
        get {
            rawValue as? String
        }
        set {
            if let newValue {
                rawValue = newValue
            }
        }
    }
    
    public var boolValue: Bool? {
        get {
            rawValue as? Bool
        }
        set {
            if let newValue {
                rawValue = newValue
            }
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let value = try? container.decode(Int.self) {
            rawValue = value
        } else if let value = try? container.decode(Double.self) {
            rawValue = value
        } else if let value = try? container.decode(String.self) {
            rawValue = value
        } else {
            let value = try container.decode(Bool.self)
            rawValue = value
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        if let intValue {
            try container.encode(intValue)
        } else if let doubleValue {
            try container.encode(doubleValue)
        } else if let stringValue {
            try container.encode(stringValue)
        } else if let boolValue {
            try container.encode(boolValue)
        }
    }
}
