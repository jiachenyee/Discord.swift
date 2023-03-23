//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct RoleSubscriptionData: Codable {
    /// the id of the sku and listing that the user is subscribed to
    var roleSubscriptionListingId: Snowflake
    
    /// the name of the tier that the user is subscribed to
    var tierName: String
    
    /// the cumulative number of months that the user has been subscribed for
    var totalMonthsSubscribed: Int
    
    /// whether this notification is for a renewal rather than a new purchase
    var isRenewal: Bool
    
    enum CodingKeys: String, CodingKey {
        case roleSubscriptionListingId = "role_subscription_listing_id"
        case tierName = "tier_name"
        case totalMonthsSubscribed = "total_months_subscribed"
        case isRenewal = "is_renewal"
    }
}
