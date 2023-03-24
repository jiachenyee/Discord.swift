//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyCurrentMemberRequest: Codable {
    /// value to set user's nickname to
    /// - Required Permissions: `CHANGE_NICKNAME`
    public var nick: String?
    
    public init(nick: String? = nil) {
        self.nick = nick
    }
}
