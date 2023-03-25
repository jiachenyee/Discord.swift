//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct RoleTag: Codable {
    /// the id of the bot this role belongs to
    public var botId: Snowflake?
    
    /// the id of the integration this role belongs to
    public var integrationId: Snowflake?
    
    /// whether this is the guild's Booster role
    public var premiumSubscriber: Bool
    
    /// the id of this role's subscription sku and listing
    public var subscriptionListingId: Snowflake?
    
    /// whether this role is available for purchase
    public var availableForPurchase: Bool
    
    /// whether this role is a guild's linked role
    public var guildConnections: Bool
    
    enum CodingKeys: String, CodingKey {
        case botId = "bot_id"
        case integrationId = "integration_id"
        case premiumSubscriber = "premium_subscriber"
        case subscriptionListingId = "subscription_listing_id"
        case availableForPurchase = "available_for_purchase"
        case guildConnections = "guild_connections"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.botId = try container.decodeIfPresent(Snowflake.self, forKey: .botId)
        self.integrationId = try container.decodeIfPresent(Snowflake.self, forKey: .integrationId)
        self.premiumSubscriber = container.allKeys.contains(.premiumSubscriber)
        self.subscriptionListingId = try container.decodeIfPresent(Snowflake.self, forKey: .subscriptionListingId)
        self.availableForPurchase = container.allKeys.contains(.availableForPurchase)
        self.guildConnections = container.allKeys.contains(.guildConnections)
    }
}
