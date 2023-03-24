//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum ThreadType: Int, Codable {
    /// a temporary sub-channel within a guildText or guildForum channel
    case publicThread = 11
    /// a temporary sub-channel within a guildText channel that is only viewable by those invited and those with the manageThreads permission
    case privateThread = 12
}
