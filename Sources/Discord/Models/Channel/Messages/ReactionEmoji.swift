//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ReactionEmoji {
    public var name: String
    public var id: Snowflake?
    
    init(name: String, id: Snowflake? = nil) {
        self.name = name
        self.id = id
    }
    
    public static func custom(name: String, id: Snowflake) -> Self {
        Self(name: name, id: id)
    }
    
    public static func emoji(_ emoji: String) -> Self {
        Self(name: emoji)
    }
    
    func toURLComponent() -> String {
        var result = name.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        
        if let id {
            result += ":\(id)"
        }
        
        return result
    }
}
