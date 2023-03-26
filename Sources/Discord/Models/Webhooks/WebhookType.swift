//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public enum WebhookType: Int, Codable {
    /// Incoming Webhooks can post messages to channels with a generated token
    case incoming = 1
    
    /// Channel Follower Webhooks are internal webhooks used with Channel Following to post new messages into channels
    case channelFollower = 2
    
    /// Application webhooks are webhooks used with Interactions
    case application = 3
}
