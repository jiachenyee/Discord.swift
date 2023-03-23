//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public enum TriggerType: Int, Codable {
    /// check if content contains words from a user defined list of keywords
    case keyword = 1
    /// check if content represents generic spam
    case spam = 3
    /// check if content contains words from internal pre-defined wordsets
    case keywordPreset = 4
    /// check if content contains more unique mentions than allowed
    case mentionSpam = 5
}
