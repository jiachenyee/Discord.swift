//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayIntegration: GatewayEventData {
    /// integration id
    public var id: Snowflake
    
    /// integration name
    public var name: String
    
    /// integration type (twitch, youtube, discord, or guild_subscription)
    public var type: String
    
    /// is this integration enabled
    public var enabled: Bool
    
    /// is this integration syncing
    public var syncing: Bool?
    
    /// id that this integration uses for "subscribers"
    public var roleId: Snowflake?
    
    /// whether emoticons should be synced for this integration (twitch only currently)
    public var enableEmoticons: Bool?
    
    /// the behavior of expiring subscribers
    public var expireBehavior: IntegrationExpireBehaviour?
    
    /// the grace period (in days) before expiring subscribers
    public var expireGracePeriod: Int?
    
    /// user for this integration
    public var user: User?
    
    /// integration account information
    public var account: IntegrationAccount
    
    /// when this integration was last synced
    public var syncedAt: ISO8601Timestamp?
    
    /// how many subscribers this integration has
    public var subscriberCount: Int?
    
    /// has this integration been revoked
    public var revoked: Bool?
    
    /// The bot/OAuth2 application for discord integrations
    public var application: IntegrationApplication?
    
    /// the scopes the application has been authorized for
    public var scopes: [OAuth2Scope]?
    
    /// ID of the guild
    public var guildId: Snowflake
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case enabled = "enabled"
        case syncing = "syncing"
        case roleId = "role_id"
        case enableEmoticons = "enable_emoticons"
        case expireBehavior = "expire_behavior"
        case expireGracePeriod = "expire_grace_period"
        case user = "user"
        case account = "account"
        case syncedAt = "synced_at"
        case subscriberCount = "subscriber_count"
        case revoked = "revoked"
        case application = "application"
        case scopes = "scopes"
        case guildId = "guild_id"
    }
}
