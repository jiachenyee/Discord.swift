//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct ModifyStageInstanceRequest: Codable {
    /// The topic of the Stage instance (1-120 characters)
    public var topic: String?
    
    /// The privacy level of the Stage instance
    public var privacyLevel: StagePrivacyLevel?
    
    enum CodingKeys: String, CodingKey {
        case topic = "topic"
        case privacyLevel = "privacy_level"
    }
    
    public init(topic: String? = nil, privacyLevel: StagePrivacyLevel? = nil) {
        self.topic = topic
        self.privacyLevel = privacyLevel
    }
    
    public static func modifying(topic: String? = nil,
                                 privacyLevel: StagePrivacyLevel? = nil) -> Self {
        Self(topic: topic,
             privacyLevel: privacyLevel)
    }
}
