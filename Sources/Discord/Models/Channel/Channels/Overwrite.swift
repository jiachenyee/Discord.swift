//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public struct Overwrite: Codable {
    /// role or user id
    public var id: Snowflake
    
    /// either 0 (role) or 1 (member)
    public var type: OverwriteType
    
    /// permission bit set
    public var allow: Permissions
    
    /// permission bit set
    public var deny: Permissions
    
    public init(id: Snowflake, type: OverwriteType, allow: Permissions, deny: Permissions) {
        self.id = id
        self.type = type
        self.allow = allow
        self.deny = deny
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Snowflake.self, forKey: .id)
        self.type = try container.decode(Overwrite.OverwriteType.self, forKey: .type)
        self.allow = try container.decode(Permissions.self, forKey: .allow)
        self.deny = try container.decode(Permissions.self, forKey: .deny)
    }
    
    public enum OverwriteType: String, Codable {
        case role
        case member
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            if let intValue = try? container.decode(Int.self) {
                switch intValue {
                case 0:
                    self = .role
                case 1:
                    self = .member
                default:
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid integer value: \(intValue)")
                }
            } else if let rawValue = try? container.decode(String.self) {
                switch rawValue {
                case "role":
                    self = .role
                case "member":
                    self = .member
                default:
                    throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid string value: \(rawValue)")
                }
            } else {
                throw DecodingError.typeMismatch(OverwriteType.self,
                                                 DecodingError.Context(codingPath: decoder.codingPath,
                                                                       debugDescription: "Invalid value"))
            }
        }
        
        public func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            switch self {
            case .role:
                try container.encode(0)
            case .member:
                try container.encode(1)
            }
        }
    }
}
