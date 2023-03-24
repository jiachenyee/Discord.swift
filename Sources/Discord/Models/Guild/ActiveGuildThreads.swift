//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ActiveGuildThreads: Codable {
    public var threads: [Channel]
    public var members: [ThreadMember]
}
