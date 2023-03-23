//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AutoModerationAction: Codable {
    /// the type of action
    public var type: AutoModerationActionType
    
    /// additional metadata needed during execution for this specific action type
    public var metadata: AutoModerationActionMetadata?
    
    public static func blockMessage(customMessage: String? = nil) -> Self {
        AutoModerationAction(type: .blockMessage,
                             metadata: .init(customMessage: customMessage))
    }
    
    public static func sendAlertMessage(channel: Snowflake) -> Self {
        AutoModerationAction(type: .sendAlertMessage,
                             metadata: .init(channelId: channel))
    }
    
    public static func timeout(durationSeconds: Int) -> Self {
        AutoModerationAction(type: .timeout,
                             metadata: .init(durationSeconds: durationSeconds))
    }
}
