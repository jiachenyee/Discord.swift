//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 21/3/23.
//

import Foundation

public enum ChannelType: Int, Codable {
    /// a text channel within a server
    case guildText = 0
    /// a direct message between users
    case directMessage = 1
    /// a voice channel within a server
    case guildVoice = 2
    /// a direct message between multiple users
    case groupDM = 3
    /// an organizational category that contains up to 50 channels
    case guildCategory = 4
    /// a channel that users can follow and crosspost into their own server (formerly news channels)
    case guildAnnouncement = 5
    /// a temporary sub-channel within a guildAnnouncement channel
    case announcementThread = 10
    /// a temporary sub-channel within a guildText or guildForum channel
    case publicThread = 11
    /// a temporary sub-channel within a guildText channel that is only viewable by those invited and those with the manageThreads permission
    case privateThread = 12
    /// a voice channel for hosting events with an audience
    case guildStageVoice = 13
    /// the channel in a hub containing the listed servers
    case guildDirectory = 14
    /// Channel that can only contain threads
    case guildForum = 15
}
