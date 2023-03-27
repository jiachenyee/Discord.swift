//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct Component: Codable {
    
    public var value: ComponentValue
    
    enum CodingKeys: CodingKey {
        case type
    }
    
    public static func actionRow(components: [Component]) -> Self {
        Component(value: .actionRow(ActionRow(components: components)))
    }
    
    public static func button(_ button: Button) -> Self {
        Component(value: .button(button))
    }
    
    public static func selectMenu(_ selectMenu: SelectMenu) -> Self {
        Component(value: .selectMenu(selectMenu))
    }
    
    public static func textInput(_ textInput: TextInput) -> Self {
        Component(value: .textInput(textInput))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch value {
        case .actionRow(let actionRow):
            try container.encode(actionRow)
        case .button(let button):
            try container.encode(button)
        case .selectMenu(let selectMenu):
            try container.encode(selectMenu)
        case .textInput(let textInput):
            try container.encode(textInput)
        }
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type: ComponentType = try container.decode(ComponentType.self, forKey: .type)
        
        switch type {
        case .actionRow:
            self.value = .actionRow(try ActionRow(from: decoder))
        case .button:
            self.value = .button(try Button(from: decoder))
        case .stringSelect:
            self.value = .selectMenu(try SelectMenu(from: decoder))
        case .textInput:
            self.value = .textInput(try TextInput(from: decoder))
        case .userSelect:
            self.value = .selectMenu(try SelectMenu(from: decoder))
        case .roleSelect:
            self.value = .selectMenu(try SelectMenu(from: decoder))
        case .mentionableSelect:
            self.value = .selectMenu(try SelectMenu(from: decoder))
        case .channelSelect:
            self.value = .selectMenu(try SelectMenu(from: decoder))
        }
    }
    
    public init(value: ComponentValue) {
        self.value = value
    }
}
