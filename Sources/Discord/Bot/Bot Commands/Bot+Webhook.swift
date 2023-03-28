//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func createWebhook(channel channelId: Snowflake,
                       webhook: CreateWebhookRequest,
                       reason: String? = nil) async throws -> Webhook {
        try await sendRequest(Webhook.self,
                              endpoint: "channels/\(channelId)/webhooks",
                              method: .post,
                              data: webhook,
                              reason: reason)
    }
    
    func getChannelWebhook(channel channelId: Snowflake) async throws -> [Webhook] {
        try await sendRequest([Webhook].self,
                              endpoint: "channels/\(channelId)/webhooks")
    }
    
    func getGuildWebhook(guild guildId: Snowflake) async throws -> [Webhook] {
        try await sendRequest([Webhook].self,
                              endpoint: "guilds/\(guildId)/webhooks")
    }
    
    func getWebhook(_ webhookId: Snowflake) async throws -> Webhook {
        try await sendRequest(Webhook.self,
                              endpoint: "webhooks/\(webhookId)")
    }
    
    func modifyWebhook(_ webhookId: Snowflake,
                       modifications: ModifyWebhook,
                       reason: String? = nil) async throws -> Webhook {
        try await sendRequest(Webhook.self,
                              endpoint: "webhooks/\(webhookId)",
                              method: .patch,
                              data: modifications,
                              reason: reason)
    }
    
    func deleteWebhook(_ webhookId: Snowflake,
                       reason: String? = nil) async throws {
        try await sendRequest(endpoint: "webhooks/\(webhookId)",
                              method: .delete,
                              reason: reason)
    }
}
