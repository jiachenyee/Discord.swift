//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum MFALevel: Int, Codable {
    /// guild has no MFA/2FA requirement for moderation actions
    case noMFA = 0
    /// guild has a 2FA requirement for moderation actions
    case elevated = 1
}
