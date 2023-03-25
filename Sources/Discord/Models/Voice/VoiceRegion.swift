//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct VoiceRegion: Codable {
    /// unique ID for the region
    public var id: String
    
    /// name of the region
    public var name: String
    
    /// true for a single server that is closest to the current user's client
    public var optimal: Bool
    
    /// whether this is a deprecated voice region (avoid switching to these)
    public var deprecated: Bool
    
    /// whether this is a custom voice region (used for events/etc)
    public var custom: Bool
}
