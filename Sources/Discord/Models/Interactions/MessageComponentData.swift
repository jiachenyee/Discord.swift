//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct MessageComponentData: GatewayEventData {
    /// the `custom_id` of the component
    public var customId: String
    /// the type of the component
    public var componentType: ComponentType
    /// values the user selected in a select menu component
    public var values: [String] // not sure
    
    enum CodingKeys: String, CodingKey {
        case customId = "custom_id"
        case componentType = "component_type"
        case values = "values"
    }
}
