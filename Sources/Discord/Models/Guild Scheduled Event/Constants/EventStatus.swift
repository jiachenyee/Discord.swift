//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public enum EventStatus: Int, Codable {
    case scheduled = 1
    case active = 2
    case completed = 3
    case cancelled = 4
}
