//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct PruneFilter: Parameterable {
    /// number of days to count prune for (1-30)
    public var days: Int?
    
    /// comma-delimited array of snowflakes    role(s) to include    none
    public var includeRoles: String?
    
    
    public init(days: Int? = nil,
                includeRoles: String? = nil) {
        self.days = days
        self.includeRoles = includeRoles
    }
    
    public static func using(days: Int? = nil,
                             includeRoles: String? = nil) -> Self {
        
        Self(days: days,
             includeRoles: includeRoles)
    }
    
    enum CodingKeys: String, CodingKey {
        case days
        case includeRoles = "include_roles"
    }
}
