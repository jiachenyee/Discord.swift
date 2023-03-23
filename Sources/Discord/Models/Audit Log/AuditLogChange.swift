//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AuditLogChange: Codable {
    /// mixed (matches object field's type) New value of the key
    public var newValue: Mixed
    
    /// mixed (matches object field's type) Old value of the key
    public var oldValue: Mixed
    
    /// Name of the changed entity, with a few exceptions
    public var key: String
}
