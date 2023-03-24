//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum VerificationLevel: Int, Codable {
    /// unrestricted
    case noVerification = 0
    /// must have verified email on account
    case low = 1
    /// must be registered on Discord for longer than 5 minutes
    case medium = 2
    /// must be a member of the server for longer than 10 minutes
    case high = 3
    /// must have a verified phone number
    case veryHigh = 4
}
