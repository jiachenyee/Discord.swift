//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct ChannelPermission: Codable {
    
    /// the bitwise value of all allowed permissions (default "0")
    public var allow: Permissions?
    
    /// the bitwise value of all disallowed permissions (default "0")
    public var deny: Permissions?
    
    /// 0 for a role or 1 for a member
    public var type: ChannelPermissionType
    
    public init(allow: Permissions? = nil, deny: Permissions? = nil, type: ChannelPermissionType) {
        self.allow = allow
        self.deny = deny
        self.type = type
    }
    
    public static func role(allow: Permissions? = nil, deny: Permissions? = nil) -> Self {
        Self(allow: allow,
             deny: deny,
             type: .role)
    }
    
    public static func member(allow: Permissions? = nil, deny: Permissions? = nil) -> Self {
        Self(allow: allow,
             deny: deny,
             type: .member)
    }
}
