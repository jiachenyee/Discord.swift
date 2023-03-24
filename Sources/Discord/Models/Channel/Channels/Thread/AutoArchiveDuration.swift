//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum AutoArchiveDuration: Int, Codable {
    case oneHour = 60
    case oneDay = 1440
    case threeDays = 4320
    case oneWeek = 10080
}
