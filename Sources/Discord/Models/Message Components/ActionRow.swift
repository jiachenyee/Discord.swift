//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct ActionRow: Codable {
    public var type: ComponentType = .actionRow
    public var components: [Component]
}
