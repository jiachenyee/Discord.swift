//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct InteractionData: Codable {
    
    public var applicationCommmand: ApplicationCommandData?
    public var messageComponent: MessageComponentData?
    public var modalSubmit: ModalSubmitData?
    
    public func encode(to encoder: Encoder) throws {}
    
    enum CodingKeys: CodingKey {
        case type
        case data
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let type = try container.decode(InteractionType.self, forKey: .type)
        
        switch type {
        case .ping: break
        case .applicationCommand, .applicationCommandAutocomplete:
            applicationCommmand = try container.decode(ApplicationCommandData.self, forKey: .data)
        case .messageComponent:
            messageComponent = try container.decode(MessageComponentData.self, forKey: .data)
        case .modalSubmit:
            modalSubmit = try container.decode(ModalSubmitData.self, forKey: .data)
        }
    }
}
