//
//  File.swift
//
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct VoiceState: Codable, GatewayEventData {
    /// the guild id this voice state is for
    public var guildId: Snowflake?
    
    /// the channel id this user is connected to
    public var channelId: Snowflake?
    
    /// the user id this voice state is for
    public var userId: Snowflake
    
    /// the guild member this voice state is for
    public var member: GuildMember?
    
    /// the session id for this voice state
    public var sessionId: String
    /// whether this user is deafened by the server
    public var deaf: Bool
    
    /// whether this user is muted by the server
    public var mute: Bool
    
    /// whether this user is locally deafened
    public var selfDeaf: Bool
    
    /// whether this user is locally muted
    public var selfMute: Bool
    
    /// whether this user is streaming using "Go Live"
    public var selfStream: Bool?
    
    /// whether this user's camera is enabled
    public var selfVideo: Bool
    
    /// whether this user's permission to speak is denied
    public var suppress: Bool
    
    /// the time at which the user requested to speak
    public var requestToSpeakTimestamp: ISO8601Timestamp?
    
    enum CodingKeys: String, CodingKey {
        case guildId = "guild_id"
        case channelId = "channel_id"
        case userId = "user_id"
        case member = "member"
        case sessionId = "session_id"
        case deaf = "deaf"
        case mute = "mute"
        case selfDeaf = "self_deaf"
        case selfMute = "self_mute"
        case selfStream = "self_stream"
        case selfVideo = "self_video"
        case suppress = "suppress"
        case requestToSpeakTimestamp = "request_to_speak_timestamp"
    }
    
    public init(guildId: Snowflake? = nil,
                channelId: Snowflake? = nil,
                userId: Snowflake,
                member: GuildMember? = nil,
                sessionId: String,
                deaf: Bool,
                mute: Bool,
                selfDeaf: Bool,
                selfMute: Bool,
                selfStream: Bool? = nil,
                selfVideo: Bool,
                suppress: Bool,
                requestToSpeakTimestamp: ISO8601Timestamp? = nil) {
        self.guildId = guildId
        self.channelId = channelId
        self.userId = userId
        self.member = member
        self.sessionId = sessionId
        self.deaf = deaf
        self.mute = mute
        self.selfDeaf = selfDeaf
        self.selfMute = selfMute
        self.selfStream = selfStream
        self.selfVideo = selfVideo
        self.suppress = suppress
        self.requestToSpeakTimestamp = requestToSpeakTimestamp
    }
}
