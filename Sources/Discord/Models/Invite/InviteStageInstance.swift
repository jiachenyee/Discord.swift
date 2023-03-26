//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct InviteStageInstance: Codable {
    /// the members speaking in the Stage
    public var members: [GuildMember]
    /// the number of users in the Stage
    public var participantCount: Int
    /// the number of users speaking in the Stage
    public var speakerCount: Int
    /// the topic of the Stage instance (1-120 characters)
    public var topic: String
    
    enum CodingKeys: String, CodingKey {
        case members = "members"
        case participantCount = "participant_count"
        case speakerCount = "speaker_count"
        case topic = "topic"
    }
}
