//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct GuildMember: Codable {
    /// the user this guild member represents
    public var user: User?
    
    /// this user's guild nickname
    public var nick: String?
    
    /// the member's guild avatar hash
    public var avatar: String?
    
    /// array of role object ids
    public var roles: [Snowflake]
    
    /// when the user joined the guild
    public var joinedAt: ISO8601Timestamp
    
    /// when the user started boosting the guild
    public var premiumSince: ISO8601Timestamp?
    
    /// whether the user is deafened in voice channels
    public var deaf: Bool
    
    /// whether the user is muted in voice channels
    public var mute: Bool
    
    /// guild member flags represented as a bit set, defaults to 0
    public var flags: GuildMemberFlags
    
    /// whether the user has not yet passed the guild's Membership Screening requirements
    public var pending: Bool?
    
    /// total permissions of the member in the channel, including overwrites, returned when in the interaction object
    public var permissions: String?
    
    /// when the user's timeout will expire and the user will be able to communicate in the guild again, null or a time in the past if the user is not timed out
    public var communicationDisabledUntil: ISO8601Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case user = "user"
        case nick = "nick"
        case avatar = "avatar"
        case roles = "roles"
        case joinedAt = "joined_at"
        case premiumSince = "premium_since"
        case deaf = "deaf"
        case mute = "mute"
        case flags = "flags"
        case pending = "pending"
        case permissions = "permissions"
        case communicationDisabledUntil = "communication_disabled_until"
    }
}
