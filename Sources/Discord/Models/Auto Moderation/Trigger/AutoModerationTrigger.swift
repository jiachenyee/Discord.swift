//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct AutoModerationTrigger {
    var triggerType: TriggerType
    var triggerMetadata: TriggerMetadata?
    
    public static func keyword(keywordFilter: [String],
                               regexPatterns: [String] = [],
                               allowList: [String] = []) -> Self {
        .init(triggerType: .keyword,
              triggerMetadata: .init(keywordFilter: keywordFilter,
                                     regexPatterns: regexPatterns,
                                     allowList: allowList))
    }
    
    public static func keywordPreset(presets: [KeywordPresetType],
                                     allowList: [String]) -> Self {
        .init(triggerType: .keywordPreset,
              triggerMetadata: .init(presets: presets,
                                     allowList: allowList))
    }
    
    public static func mentionSpam(mentionTotalLimit: Int) -> Self {
        .init(triggerType: .mentionSpam,
              triggerMetadata: .init(mentionTotalLimit: mentionTotalLimit))
    }
    
    public static func spam() -> Self {
        .init(triggerType: .spam)
    }
}
