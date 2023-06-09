//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct UnavailableGuild: Codable, GatewayEventData {
    public var id: Snowflake
    public var unavailable: Bool
}
