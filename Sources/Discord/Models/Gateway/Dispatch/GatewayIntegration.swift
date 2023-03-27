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
    public var role_id: Snowflake?
    
    /// whether emoticons should be synced for this integration (twitch only currently)
    public var enable_emoticons: Bool?
    
    /// the behavior of expiring subscribers
    public var expire_behavior: IntegrationExpireBehaviour?
    
    /// the grace period (in days) before expiring subscribers
    public var expire_grace_period: Int?
    
    /// user for this integration
    public var user: User?
    
    /// integration account information
    public var account: IntegrationAccount
    
    /// when this integration was last synced
    public var synced_at: ISO8601Timestamp?
    
    /// how many subscribers this integration has
    public var subscriber_count: Int?
    
    /// has this integration been revoked
    public var revoked: Bool?
    
    /// The bot/OAuth2 application for discord integrations
    public var application: IntegrationApplication?
    
    /// the scopes the application has been authorized for
    //    public var scopes?    array of OAuth2 scopes
#warning("oauth2 scopes missing")
    
    /// ID of the guild
    public var guild_id: Snowflake
}
