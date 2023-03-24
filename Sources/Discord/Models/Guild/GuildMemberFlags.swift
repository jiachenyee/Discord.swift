//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildMemberFlags: OptionSet, Codable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    ///Member has left and rejoined the guild    false
    public static let didRejoin = Self(rawValue: 1 << 0)
    
    ///Member has completed onboarding    false
    public static let completedOnboarding = Self(rawValue: 1 << 1)
    
    ///Member is exempt from guild verification requirements    true
    public static let bypassesVerification = Self(rawValue: 1 << 2)
    
    ///Member has started onboarding    false
    public static let startedOnboarding = Self(rawValue: 1 << 3)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(rawValue)
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        rawValue = try container.decode(Int.self)
    }
}
