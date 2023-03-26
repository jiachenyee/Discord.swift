//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension Bot {
    /// Get a list of all rules currently configured for the guild.
    /// - Parameter guildId: The guild ID of the target guild.
    /// - Returns: Returns a list of auto moderation rule objects for the given guild.
    /// - Important: This endpoint requires the `MANAGE_GUILD` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/auto-moderation#get-auto-moderation-rule](https://discord.com/developers/docs/resources/auto-moderation#get-auto-moderation-rule)
    func listAutoModerationRules(forGuild guildId: Snowflake) async throws -> [AutoModerationRule] {
        try await sendRequest([AutoModerationRule].self,
                              endpoint: "/guilds/\(guildId)/auto-moderation/rules")
    }
    
    /// Get one single auto-moderation rule of the guild.
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - ruleId: The ID of the rule returned.
    /// - Returns: Returns an auto moderation rule object.
    /// - Important: This endpoint requires the `MANAGE_GUILD` permission.
    ///  > Discord Reference: [https://discord.com/developers/docs/resources/auto-moderation#get-auto-moderation-rule](https://discord.com/developers/docs/resources/auto-moderation#get-auto-moderation-rule)
    
    func getAutoModerationRule(forGuild guildId: Snowflake,
                               ruleId: Snowflake) async throws -> AutoModerationRule {
        try await sendRequest(AutoModerationRule.self,
                              endpoint: "/guilds/\(guildId)/auto-moderation/rules/\(ruleId)")
    }
    
    /// Create a new auto-moderation rule.
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - rule: The configuration of the rule created.
    /// - Returns: Returns an auto moderation rule on success. Fires an Auto Moderation Rule Create Gateway event.
    /// - Important: This endpoint requires the `MANAGE_GUILD` permission
    /// > Discord Reference: [https://discord.com/developers/docs/resources/auto-moderation#create-auto-moderation-rule](https://discord.com/developers/docs/resources/auto-moderation#create-auto-moderation-rule)
    @discardableResult
    func createAutoModerationRule(forGuild guildId: Snowflake,
                                  rule: AutoModerationRuleRequest) async throws -> AutoModerationRule {
        try await sendRequest(AutoModerationRule.self,
                              endpoint: "/guilds/\(guildId)/auto-moderation/rules",
                              method: .post,
                              data: rule)
    }
    
    /// Modify an existing auto-moderation rule.
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - ruleId: The ID of the target rule.
    ///   - rule: The updated configurations of the target rule.
    /// - Returns: Returns an auto moderation rule on success. Fires an Auto Moderation Rule Update Gateway event.
    /// - Important: Requires `MANAGE_GUILD` permissions.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/auto-moderation#modify-auto-moderation-rule](https://discord.com/developers/docs/resources/auto-moderation#modify-auto-moderation-rule)
    @discardableResult
    func updateAutoModerationRule(forGuild guildId: Snowflake,
                                  ruleId: Snowflake,
                                  rule: AutoModerationRuleUpdateRequest) async throws -> AutoModerationRule {
        try await sendRequest(AutoModerationRule.self,
                              endpoint: "/guilds/\(guildId)/auto-moderation/rules/\(ruleId)",
                              method: .patch,
                              data: rule)
    }
    
    /// Delete an auto-moderation rule.
    /// - Parameters:
    ///   - guildId: The guild ID of the target guild.
    ///   - ruleId: The rule ID of the target rule.
    /// - Important: This endpoint requires the `MANAGE_GUILD` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/auto-moderation#delete-auto-moderation-rule](https://discord.com/developers/docs/resources/auto-moderation#delete-auto-moderation-rule)
    func deleteAutoModerationRule(forGuild guildId: Snowflake,
                                  ruleId: Snowflake) async throws {
        try await sendRequest(endpoint: "/guilds/\(guildId)/auto-moderation/rules/\(ruleId)",
                              method: .delete)
    }
}
