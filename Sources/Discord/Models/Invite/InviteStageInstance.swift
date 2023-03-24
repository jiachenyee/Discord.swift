//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public struct InviteStageInstance: Codable {
    ///      the members speaking in the Stage
//    public var members: array of partial guild member objects
    ///     the number of users in the Stage
    public var participant_count: Int
    ///     the number of users speaking in the Stage
    public var speaker_count: Int
    ///     the topic of the Stage instance (1-120 characters)
    public var topic: String
}
