//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct TriggerMetadata: Codable {
    /// substrings which will be searched for in content (Maximum of 1000)
    public var keywordFilter: [String]?
    
    /// regular expression patterns which will be matched against content (Maximum of 10)
    public var regexPatterns: [String]?
    
    /// the internally pre-defined wordsets which will be searched for in content
    public var presets: [KeywordPresetType]?
    
    /// substrings which should not trigger the rule (Maximum of 100 or 1000)
    public var allowList: [String]?
    
    /// total number of unique role and user mentions allowed per message (Maximum of 50)
    public var mentionTotalLimit: Int?
    
    enum CodingKeys: String, CodingKey {
        case keywordFilter = "keyword_filter"
        case regexPatterns = "regex_patterns"
        case presets = "presets"
        case allowList = "allow_list"
        case mentionTotalLimit = "mention_total_limit"
    }
    
    init(keywordFilter: [String]? = nil, regexPatterns: [String]? = nil, presets: [KeywordPresetType]? = nil, allowList: [String]? = nil, mentionTotalLimit: Int? = nil) {
        self.keywordFilter = keywordFilter
        self.regexPatterns = regexPatterns
        self.presets = presets
        self.allowList = allowList
        self.mentionTotalLimit = mentionTotalLimit
    }
}
