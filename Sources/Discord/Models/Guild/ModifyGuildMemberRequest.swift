//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct ModifyGuildMemberRequest: Codable {
    
    /// value to set user's nickname to
    /// Required Permission: `MANAGE_NICKNAMES`
    public var nick: String?
    
    /// array of role ids the member is assigned
    /// Required Permission: `MANAGE_ROLES`
    public var roles: [Snowflake]?
    
    /// whether the user is muted in voice channels. Will throw a 400 error if the user is not in a voice channel
    /// Required Permission: `MUTE_MEMBERS`
    public var mute: Bool?
    
    /// whether the user is deafened in voice channels. Will throw a 400 error if the user is not in a voice channel
    /// Required Permission: `DEAFEN_MEMBERS`
    public var deaf: Bool?
    
    /// id of channel to move user to (if they are connected to voice)
    /// Required Permission: `MOVE_MEMBERS`
    public var channelId: Snowflake?
    
    /// when the user's timeout will expire and the user will be able to communicate in the guild again (up to 28 days in the future), set to null to remove timeout. Will throw a 403 error if the user has the ADMINISTRATOR permission or is the owner of the guild
    /// Required Permission: `MODERATE_MEMBERS`
    public var communicationDisabledUntil: ISO8601Timestamp?
    
    /// guild member flags
    /// Required Permission: `MODERATE_MEMBERS`
    public var flags: GuildMemberFlags?
    
    enum CodingKeys: String, CodingKey {
        case nick = "nick"
        case roles = "roles"
        case mute = "mute"
        case deaf = "deaf"
        case channelId = "channel_id"
        case communicationDisabledUntil = "communication_disabled_until"
        case flags = "flags"
    }
    
    public init(nick: String? = nil,
                roles: [Snowflake]? = nil,
                mute: Bool? = nil,
                deaf: Bool? = nil,
                channelId: Snowflake? = nil,
                communicationDisabledUntil: ISO8601Timestamp? = nil,
                flags: GuildMemberFlags? = nil) {
        self.nick = nick
        self.roles = roles
        self.mute = mute
        self.deaf = deaf
        self.channelId = channelId
        self.communicationDisabledUntil = communicationDisabledUntil
        self.flags = flags
    }
}
