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
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let rawValue = try Array(container.decode(String.self))
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = .init(identifier: "UTC")!
        
        let components: DateComponents
        
        if rawValue.count == 32 {
            guard let year = Int(String(rawValue[0...3])),
                  let month = Int(String(rawValue[5...6])),
                  let day = Int(String(rawValue[8...9])),
                  let hour = Int(String(rawValue[11...12])),
                  let minute = Int(String(rawValue[14...15])),
                  let second = Int(String(rawValue[17...18])),
                  let microSecond = Int(String(rawValue[20...25])) else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: String(rawValue)))
            }
            components = DateComponents(
                calendar: calendar,
                year: year,
                month: month,
                day: day,
                hour: hour,
                minute: minute,
                second: second,
                nanosecond: microSecond * 1_000
            )
        } else if rawValue.count == 25 {
            guard let year = Int(String(rawValue[0...3])),
                  let month = Int(String(rawValue[5...6])),
                  let day = Int(String(rawValue[8...9])),
                  let hour = Int(String(rawValue[11...12])),
                  let minute = Int(String(rawValue[14...15])),
                  let second = Int(String(rawValue[17...18]))
            else {
                throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: String(rawValue)))
            }
            components = DateComponents(
                calendar: calendar,
                year: year,
                month: month,
                day: day,
                hour: hour,
                minute: minute,
                second: second
            )
        } else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: String(rawValue)))
        }
        
        guard let date = calendar.date(from: components) else {
            throw DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: String(rawValue)))
        }
        
        self.date = date
    }
}
