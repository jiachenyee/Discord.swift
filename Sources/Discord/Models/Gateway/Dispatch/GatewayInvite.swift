//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct GatewayInvite: GatewayEventData {
    /// Channel the invite is for
    public var channelId: Snowflake
    
    /// Unique invite code
    public var code: String
    
    /// Time at which the invite was created
    public var createdAt: ISO8601Timestamp
    
    /// Guild of the invite
    public var guildId: Snowflake?
    
    /// User that created the invite
    public var inviter: User?
    
    /// How long the invite is valid for (in seconds)
    public var maxAge: Int
    
    /// Maximum number of times the invite can be used
    public var maxUses: Int
    
    /// Type of target for this voice channel invite
    public var targetType: InviteTarget?
    
    /// User whose stream to display for this voice channel stream invite
    public var targetUser: User?
    
    /// Embedded application to open for this voice channel embedded application invite
    public var targetApplication: PartialApplication?
    
    /// Whether or not the invite is temporary (invited users will be kicked on disconnect unless they're assigned a role)
    public var temporary: Bool
    
    /// How many times the invite has been used (always will be 0)
    public var uses: Int
    
    enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case code = "code"
        case createdAt = "created_at"
        case guildId = "guild_id"
        case inviter = "inviter"
        case maxAge = "max_age"
        case maxUses = "max_uses"
        case targetType = "target_type"
        case targetUser = "target_user"
        case targetApplication = "target_application"
        case temporary = "temporary"
        case uses = "uses"
    }
}
