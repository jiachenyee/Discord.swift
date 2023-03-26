//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct Invite: Codable {
    /// the invite code (unique ID)
    public var code: String
    
    /// the guild this invite is for
    public var guild: PartialGuild?
    
    /// the channel this invite is for
    public var channel: Channel?
    
    /// the user who created the invite
    public var inviter: User?
    
    /// the type of target for this voice channel invite
    public var targetType: InviteTarget?
    
    /// the user whose stream to display for this voice channel stream invite
    public var targetUser: User?
    
    /// the embedded application to open for this voice channel embedded application invite
    public var targetApplication: Application?
    
    /// approximate count of online members, returned from the GET /invites/<code> endpoint when with_counts is true
    public var approximatePresenceCount: Int?
    
    /// approximate count of total members, returned from the GET /invites/<code> endpoint when with_counts is true
    public var approximateMemberCount: Int?
    
    /// the expiration date of this invite, returned from the GET /invites/<code> endpoint when with_expiration is true
    public var expiresAt: ISO8601Timestamp?
    
    /// stage instance data if there is a public Stage instance in the Stage channel this invite is for (deprecated)
    public var stageInstance: [InviteStageInstance]?
    
    /// guild scheduled event data, only included if guild_scheduled_event_id contains a valid guild scheduled event id
    public var guildScheduledEvent: ScheduledEvent?
    
    /// number of times this invite has been used
    public var uses: Int?
    
    /// max number of times this invite can be used
    public var maxUses: Int?
    
    /// duration (in seconds) after which the invite expires
    public var maxAge: Int?
    
    /// whether this invite only grants temporary membership
    public var temporary: Bool?
    
    /// when this invite was created
    public var createdAt: ISO8601Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case guild = "guild"
        case channel = "channel"
        case inviter = "inviter"
        case targetType = "target_type"
        case targetUser = "target_user"
        case targetApplication = "target_application"
        case approximatePresenceCount = "approximate_presence_count"
        case approximateMemberCount = "approximate_member_count"
        case expiresAt = "expires_at"
        case stageInstance = "stage_instance"
        case guildScheduledEvent = "guild_scheduled_event"
        case uses = "uses"
        case maxUses = "max_uses"
        case maxAge = "max_age"
        case temporary = "temporary"
        case createdAt = "created_at"
    }
}
