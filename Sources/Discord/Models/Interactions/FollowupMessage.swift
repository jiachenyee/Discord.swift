//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public struct FollowupMessage: Codable {
    /// the message contents (up to 2000 characters)    one of content, file, embeds
    public var content: String?
    
    /// true if this is a TTS message    false
    public var tts: Bool?
    
    /// embedded rich content    one of content, file, embeds
    public var embeds: [Embed]?
    
    /// allowed mentions for the message
    public var allowedMentions: AllowedMention?
    
    //    public var components *    array of message component    the components to include with the message    false
    //    public var files[n] **    file contents    the contents of the file being sent    one of content, file, embeds
    //    public var payload_json **    string    JSON encoded body of non-file params    multipart/form-data only
    
    /// attachment objects with filename and description    false
    public var attachments: [Attachment]
    
    /// message flags combined as a bitfield (only `SUPPRESS_EMBEDS` can be set)
    public var flags: MessageFlags = []
    
    init(content: String? = nil,
         tts: Bool? = nil,
         embeds: [Embed]? = nil,
         allowedMentions: AllowedMention? = nil,
         attachments: [Attachment]) {
        self.content = content
        self.tts = tts
        self.embeds = embeds
        self.allowedMentions = allowedMentions
        self.attachments = attachments
    }
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case tts = "tts"
        case embeds = "embeds"
        case allowedMentions = "allowed_mentions"
        case attachments = "attachments"
        case flags = "flags"
    }
}
