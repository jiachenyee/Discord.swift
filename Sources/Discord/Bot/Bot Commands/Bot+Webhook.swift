//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func createWebhook(channel channelId: Snowflake,
                       webhook: CreateWebhookRequest) async throws -> Webhook {
        try await sendRequest(Webhook.self,
                              endpoint: "channels/\(channelId)/webhooks",
                              method: .post,
                              data: webhook)
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
                       modifications: ModifyWebhook) async throws -> Webhook {
        try await sendRequest(Webhook.self,
                              endpoint: "webhooks/\(webhookId)",
                              method: .patch,
                              data: modifications)
    }
    
    func deleteWebhook(_ webhookId: Snowflake) async throws {
        try await sendRequest(endpoint: "webhooks/\(webhookId)",
                              method: .delete)
    }
}
