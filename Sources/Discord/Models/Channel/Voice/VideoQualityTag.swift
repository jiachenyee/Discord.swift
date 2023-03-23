//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum VideoQualityTag: Int, Codable {
    /// Discord chooses the quality for optimal performance
    case auto = 1
    
    /// 720p
    case full = 2
}
