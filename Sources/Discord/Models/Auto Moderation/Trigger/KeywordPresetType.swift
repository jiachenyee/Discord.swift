//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum KeywordPresetType: Int, Codable {
    /// words that may be considered forms of swearing or cursing
    case profanity = 1
    /// words that refer to sexually explicit behavior or activity
    case sexualContent = 2
    /// personal insults or words that may be considered hate speech
    case slurs = 3
}
