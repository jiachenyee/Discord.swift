//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct PruneRequest: Codable {
    /// number of days to prune (1-30)    7
    public var days: Int
    
    /// whether pruned is returned, discouraged for large guilds    true
    public var computePruneCount: Bool
    
    /// role(s) to include
    public var includeRoles: [Snowflake]
    
    enum CodingKeys: String, CodingKey {
        case days = "days"
        case computePruneCount = "compute_prune_count"
        case includeRoles = "include_roles"
    }
    
    public init(days: Int, computePruneCount: Bool, includeRoles: [Snowflake]) {
        self.days = days
        self.computePruneCount = computePruneCount
        self.includeRoles = includeRoles
    }
}
