//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Reaction: Codable {
    /// times this emoji has been used to react
    public var count: Int
    
    /// whether the current user reacted using this emoji
    public var me: Bool
    
    /// emoji information
    public var emoji: Emoji
    
    public init(count: Int, me: Bool, emoji: Emoji) {
        self.count = count
        self.me = me
        self.emoji = emoji
    }
}
