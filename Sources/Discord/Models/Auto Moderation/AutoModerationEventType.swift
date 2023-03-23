//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum AutoModerationEventType: Int, Codable {
    /// when a member sends or edits a message in the guild
    case messageSend = 1
}
