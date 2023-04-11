//
//  Permissions.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation

public struct Permissions: OptionSet, Codable {
    
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public var permissionValue: String {
        return String(rawValue)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        try container.encode(permissionValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let intRawValue = try? container.decode(Int.self) {
            rawValue = intRawValue
        } else {
            rawValue = Int(try container.decode(String.self))!
        }
    }
}
