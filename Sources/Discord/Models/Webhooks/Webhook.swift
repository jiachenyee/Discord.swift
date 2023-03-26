//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct Webhook: Codable {
    /// the id of the webhook
    public var id: Snowflake
    
    /// the type of the webhook
    public var type: WebhookType
     
    /// the guild id this webhook is for, if any
    public var guildId: Snowflake?
    
    /// the channel id this webhook is for, if any
    public var channelId: Snowflake?
    
    /// the user this webhook was created by (not returned when getting a webhook with its token)
    public var user: User?
    
    /// the default name of the webhook
    public var name: String?
    
    /// the default user avatar hash of the webhook
    public var avatar: String?
    
    /// the secure token of the webhook (returned for Incoming Webhooks)
    public var token: String?
    
    /// the bot/OAuth2 application that created this webhook
    public var applicationId: Snowflake?
    
    /// the guild of the channel that this webhook is following (returned for Channel Follower Webhooks)
    public var sourceGuild: PartialGuild?
    
    /// the channel that this webhook is following (returned for Channel Follower Webhooks)
    public var sourceChannel: PartialChannel?
    
    /// the url used for executing the webhook (returned by the webhooks OAuth2 flow)
    public var url: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case guildId = "guild_id"
        case channelId = "channel_id"
        case user = "user"
        case name = "name"
        case avatar = "avatar"
        case token = "token"
        case applicationId = "application_id"
        case sourceGuild = "source_guild"
        case sourceChannel = "source_channel"
        case url = "url"
    }
}
