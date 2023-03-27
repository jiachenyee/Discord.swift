//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum EmbedType: String, Codable {
    /// generic embed rendered from embed attributes
    case rich
    /// image embed
    case image
    /// video embed
    case video
    /// animated gif image embed rendered as a video embed
    case gifv
    /// article embed
    case article
    /// link embed
    case link 
}
