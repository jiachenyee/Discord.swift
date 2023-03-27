//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayClientStatus: Codable {
    /// User's status set for an active desktop (Windows, Linux, Mac) application session
    public var desktop: String?
    /// User's status set for an active mobile (iOS, Android) application session
    public var mobile: String?
    /// User's status set for an active web (browser, bot account) application session
    public var web: String?
}
