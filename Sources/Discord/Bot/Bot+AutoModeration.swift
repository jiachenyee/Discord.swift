//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension Bot {
    func listAutoModerationRules(forGuild guildId: Snowflake) async throws -> [AutoModerationRule] {
        try await sendRequest([AutoModerationRule].self,
                              endpoint: "/guilds/\(guildId)/auto-moderation/rules")
    }
    
    func getAutoModerationRule(forGuild guildId: Snowflake,
                               ruleId: Snowflake) async throws -> AutoModerationRule {
        try await sendRequest(AutoModerationRule.self,
                              endpoint: "/guilds/\(guildId)/auto-moderation/rules/\(ruleId)")
    }
    
    func createAutoModerationRule(forGuild guildId: Snowflake,
                                  rule: AutoModerationRuleRequest) async throws -> AutoModerationRule {
        try await sendRequest(AutoModerationRule.self,
                              endpoint: "/guilds/\(guildId)/auto-moderation/rules/",
                              method: .post,
                              data: rule)
    }
}
