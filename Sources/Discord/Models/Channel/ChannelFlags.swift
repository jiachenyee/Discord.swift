//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct ChannelFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    /// this thread is pinned to the top of its parent GUILD_FORUM channel
    public static let pinned = Self(rawValue: 1 << 1)
    
    /// whether a tag is required to be specified when creating a thread in a GUILD_FORUM channel. Tags are specified in the applied_tags field.
    public static let requireTag = Self(rawValue: 1 << 4)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
