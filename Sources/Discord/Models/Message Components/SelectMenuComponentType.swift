//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public enum SelectMenuComponentType: Int, Codable {
    /// Container for other components
    case actionRow = 1
    /// Button object
    case button = 2
    /// Select menu for picking from defined text options
    case stringSelect = 3
    /// Text input object
    case textInput = 4
    /// Select menu for users
    case userSelect = 5
    /// Select menu for roles
    case roleSelect = 6
    /// Select menu for mentionables (users and roles)
    case mentionableSelect = 7
    /// Select menu for channels
    case channelSelect = 8
}
