//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayGuildMemberUpdate: GatewayEventData {
    /// ID of the guild
    public var guildId: Snowflake
    
    /// User role ids
    public var roles: [Snowflake]
    
    /// User
    public var user: User
    
    /// Nickname of the user in the guild
    public var nick: String?
    
    /// Member's guild avatar hash
    public var avatar: String?
    
    /// When the user joined the guild
    public var joinedAt: ISO8601Timestamp?
    
    /// When the user starting boosting the guild
    public var premiumSince: ISO8601Timestamp?
    
    /// Whether the user is deafened in voice channels
    public var deaf: Bool?
    
    /// Whether the user is muted in voice channels
    public var mute: Bool?
    
    /// Whether the user has not yet passed the guild's Membership Screening requirements
    public var pending: Bool?
    
    /// When the user's timeout will expire and the user will be able to communicate in the guild again,
    /// null or a time in the past if the user is not timed out
    public var communicationDisabledUntil: ISO8601Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case roles = "roles"
        case user = "user"
        case nick = "nick"
        case avatar = "avatar"
        case joinedAt = "joined_at"
        case premiumSince = "premium_since"
        case deaf = "deaf"
        case mute = "mute"
        case pending = "pending"
        case communicationDisabledUntil = "communication_disabled_until"
    }
}
