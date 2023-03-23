//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension Bot {
    func getChannel(_ channelId: Snowflake) async throws -> Data {
        try await sendRequest(endpoint: "/channels/\(channelId)")
    }
    
//    func getAutoModerationRule(forGuild guildId: Snowflake,
//                               ruleId: Snowflake) async throws -> AutoModerationRule {
//        try await sendRequest(AutoModerationRule.self,
//                              endpoint: "/guilds/\(guildId)/auto-moderation/rules/\(ruleId)")
//    }
//    
//    func createAutoModerationRule(forGuild guildId: Snowflake,
//                                  rule: AutoModerationRuleRequest) async throws -> AutoModerationRule {
//        try await sendRequest(AutoModerationRule.self,
//                              endpoint: "/guilds/\(guildId)/auto-moderation/rules",
//                              method: .post,
//                              data: rule)
//    }
//    
//    func updateAutoModerationRule(forGuild guildId: Snowflake,
//                                  ruleId: Snowflake,
//                                  rule: AutoModerationRuleUpdateRequest) async throws -> AutoModerationRule {
//        try await sendRequest(AutoModerationRule.self,
//                              endpoint: "/guilds/\(guildId)/auto-moderation/rules/\(ruleId)",
//                              method: .patch,
//                              data: rule)
//    }
//    
//    func deleteAutoModerationRule(forGuild guildId: Snowflake,
//                                  ruleId: Snowflake) async throws {
//        try await sendRequest(endpoint: "/guilds/\(guildId)/auto-moderation/rules/\(ruleId)",
//                              method: .delete)
//    }
}
