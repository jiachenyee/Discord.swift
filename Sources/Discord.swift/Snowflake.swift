//
//  Snowflake.swift
//  
//
//  Created by Jia Chen Yee on 22/3/23.
//

import Foundation

public struct Snowflake: ExpressibleByStringLiteral, ExpressibleByIntegerLiteral, CustomStringConvertible, Codable {
    public var description: String {
        stringValue
    }
    
    private var snowflakeBinary: [Character]
    
    public init(integerLiteral value: Int) {
        self.init(snowflakeBinary: Array(String(value, radix: 2)))
    }
    
    public init(stringLiteral value: String) {
        self.init(snowflakeBinary: Array(String(Int(value)!, radix: 2)))
    }
    
    init(snowflakeBinary: [Character]) {
        self.snowflakeBinary = .init(repeating: "0", count: 64 - snowflakeBinary.count) + snowflakeBinary
    }
    
    public var stringValue: String {
        String(intValue)
    }
    
    public var intValue: Int {
        Int(String(snowflakeBinary), radix: 2)!
    }
    
    public var dateCreated: Date {
        let discordEpoch = 1420070400000
        let unixEpochTimeMS = Int(String(snowflakeBinary[0..<42]), radix: 2)! + discordEpoch
        
        let date = Date(timeIntervalSince1970: Double(unixEpochTimeMS) / 1000)
        
        return date
    }

    public var internalWorkerID: String {
        String(snowflakeBinary[42..<47])
    }
    
    public var internalProcessID: String {
        String(snowflakeBinary[47..<52])
    }
    
    public var generatedID: String {
        String(snowflakeBinary[52...])
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(stringValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(stringLiteral: try container.decode(String.self))
    }
}
