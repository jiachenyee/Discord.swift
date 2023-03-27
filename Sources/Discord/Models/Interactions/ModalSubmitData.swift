//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct ModalSubmitData: GatewayEventData {
    /// the `customId` of the modal
    public var customId: String
    /// the values submitted by the user
    public var components: [Component]
    
    enum CodingKeys: String, CodingKey {
        case customId = "custom_id"
        case components = "components"
    }
}
