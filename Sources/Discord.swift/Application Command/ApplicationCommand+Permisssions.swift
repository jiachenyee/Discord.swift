//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public extension ApplicationCommand {
    struct Permissions {
        /// ID of the command or the application ID
        var id: PermissionID
        /// ID of the application the command belongs to
        var application_id: String
        /// ID of the guild
        var guild_id: String
        /// Permissions for the command in the guild, max of 100
        var permissions: String
    }
    
    struct PermissionID: Codable, ExpressibleByStringLiteral {
        var rawValue: String
        
        public init(stringLiteral value: String) {
            rawValue = value
        }
        
        init(_ value: Int) {
            rawValue = String(value)
        }
        
        init(_ value: String) {
            rawValue = value
        }
        
        public static func everyone(guildId: String) -> PermissionID {
            return Self(guildId)
        }
        
        public static func allChannels(guildId: String) -> PermissionID {
            return PermissionID(Int(guildId)! - 1)
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self.rawValue)
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            self.rawValue = try container.decode(String.self)
        }
    }
    
    struct Permission {
        /// ID of the role, user, or channel. It can also be a permission constant
        var id: String
        /// application command permission type
        var type: PermissionType
        /// true to allow, false, to disallow
        var permission: Bool
    }
    
    enum PermissionType: Int, Codable {
        case user = 1
        case role = 2
        case channel = 3
    }
}
