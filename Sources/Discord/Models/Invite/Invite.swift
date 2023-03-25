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
    public var guild: Guild?
    
    /// the channel this invite is for
    public var channel: Channel?
    
    /// the user who created the invite
    public var inviter: User?
    
    /// the type of target for this voice channel invite
    public var target_type: InviteTarget?
    
    /// the user whose stream to display for this voice channel stream invite
    public var target_user: User?
    
    /// the embedded application to open for this voice channel embedded application invite
    #warning("Incomplete implementation")
//    public var target_application: partial application object?
    
    /// approximate count of online members, returned from the GET /invites/<code> endpoint when with_counts is true
    public var approximate_presence_count: Int?
    
    /// approximate count of total members, returned from the GET /invites/<code> endpoint when with_counts is true
    public var approximate_member_count: Int?
    
    /// the expiration date of this invite, returned from the GET /invites/<code> endpoint when with_expiration is true
    public var expires_at: ISO8601Timestamp?
    
    /// stage instance data if there is a public Stage instance in the Stage channel this invite is for (deprecated)
    public var stage_instance: [InviteStageInstance]?
    
    /// guild scheduled event data, only included if guild_scheduled_event_id contains a valid guild scheduled event id
    public var guild_scheduled_event: ScheduledEvent?
    
    /// number of times this invite has been used
    public var uses: Int?
    
    /// max number of times this invite can be used
    public var max_uses: Int?
    
    /// duration (in seconds) after which the invite expires
    public var max_age: Int?
    
    /// whether this invite only grants temporary membership
    public var temporary: Bool?
    
    /// when this invite was created
    public var created_at: ISO8601Timestamp?
}
