//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public enum ButtonStyle: Int, Codable {
    /// blurple
    case primary = 1
    /// grey
    case secondary = 2
    /// green
    case success = 3
    /// red
    case danger = 4
    /// grey, navigates to a URL
    case link = 5
}
