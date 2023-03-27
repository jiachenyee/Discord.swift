//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public enum InteractionType: Int, Codable {
    case ping = 1
    case applicationCommand = 2
    case messageComponent = 3
    case applicationCommandAutocomplete = 4
    case modalSubmit = 5
}
