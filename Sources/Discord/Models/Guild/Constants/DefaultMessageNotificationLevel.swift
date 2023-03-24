//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum DefaultMessageNotificationLevel: Int, Codable {
    /// members will receive notifications for all messages by default
    case allMessages = 0
    
    /// members will receive notifications only for messages that @mention them by default
    case onlyMentions = 1
}
