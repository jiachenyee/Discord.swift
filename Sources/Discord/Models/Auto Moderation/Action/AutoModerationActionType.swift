//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum AutoModerationActionType: Int, Codable {
    /// blocks a member's message and prevents it from being posted. A custom explanation can be specified and shown to members whenever their message is blocked.
    case blockMessage = 1
    
    /// logs user content to a specified channel
    case sendAlertMessage = 2
    
    /// timeout user for a specified duration *
    case timeout = 3
}
