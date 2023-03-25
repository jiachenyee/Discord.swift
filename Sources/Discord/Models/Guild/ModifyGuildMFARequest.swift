//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyGuildMFARequest: Codable {
    public var level: MFALevel
    
    public init(level: MFALevel) {
        self.level = level
    }
    
    public static func withLevel(level: MFALevel) -> Self {
        Self(level: level)
    }
}
