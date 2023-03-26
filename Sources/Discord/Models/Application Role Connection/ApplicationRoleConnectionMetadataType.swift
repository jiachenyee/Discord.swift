//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public enum ApplicationRoleConnectionMetadataType: Int, Codable {
    /// the metadata value (integer) is less than or equal to the guild's configured value (integer)
    case integerLessThanOrEqual = 1
    
    /// the metadata value (integer) is greater than or equal to the guild's configured value (integer)
    case integerGreaterThanOrEqual = 2
    
    /// the metadata value (integer) is equal to the guild's configured value (integer)
    case integerEqual = 3
    
    /// the metadata value (integer) is not equal to the guild's configured value (integer)
    case integerNotEqual = 4
    
    /// the metadata value (ISO8601 string) is less than or equal to the guild's configured value (integer; days before current date)
    case datetimeLessThanOrEqual = 5
    
    /// the metadata value (ISO8601 string) is greater than or equal to the guild's configured value (integer; days before current date)
    case datetimeGreaterThanOrEqual = 6
    
    /// the metadata value (integer) is equal to the guild's configured value (integer; 1)
    case booleanEqual = 7
    
    /// the metadata value (integer) is not equal to the guild's configured value (integer; 1)
    case booleanNotEqual = 8
}
