//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public extension ApplicationCommand {
    struct Permissions: Codable {
        /// ID of the command or the application ID
        var id: PermissionID
        /// ID of the application the command belongs to
        var applicationId: String
        /// ID of the guild
        var guildId: String
        /// Permissions for the command in the guild, max of 100
        var permissions: String
        
        enum CodingKeys: String, CodingKey {
            case id = "id"
            case applicationId = "application_id"
            case guildId = "guild_id"
            case permissions = "permissions"
        }
        
        public init(id: PermissionID,
             applicationId: String,
             guildId: String,
             permissions: String) {
            self.id = id
            self.applicationId = applicationId
            self.guildId = guildId
            self.permissions = permissions
        }
    }
    
    struct PermissionID: Codable, ExpressibleByStringLiteral {
        var rawValue: Snowflake
        
        public init(stringLiteral value: String) {
            rawValue = .init(stringLiteral: value)
        }
        
        init(_ value: Int) {
            rawValue = .init(integerLiteral: value)
        }
        
        init(_ value: String) {
            rawValue = .init(stringLiteral: value)
        }
        
        public static func everyone(guildId: Snowflake) -> PermissionID {
            return Self(guildId.intValue)
        }
        
        public static func allChannels(guildId: Snowflake) -> PermissionID {
            return PermissionID(guildId.intValue - 1)
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(self.rawValue)
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            self.rawValue = try container.decode(Snowflake.self)
        }
    }
    
    struct Permission {
        /// ID of the role, user, or channel. It can also be a permission constant
        var id: String
        /// application command permission type
        var type: PermissionType
        /// true to allow, false, to disallow
        var permission: Bool
        
        public init(id: String, type: PermissionType, permission: Bool) {
            self.id = id
            self.type = type
            self.permission = permission
        }
    }
    
    enum PermissionType: Int, Codable {
        case user = 1
        case role = 2
        case channel = 3
    }
}
