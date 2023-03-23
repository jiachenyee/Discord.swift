//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum ForumLayoutTypes: Int, Codable {
    /// No default has been set for forum channel
    case notSet = 0
    
    /// Display posts as a list
    case listView = 1
    
    /// Display posts as a collection of tiles
    case galleryView = 2
}
