//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct MessageEdit: Codable {
    /// Message contents (up to 2000 characters)
    public var content: String?
    
    /// Up to 10 rich embeds (up to 6000 characters)
    public var embeds: [Embed]?
    
    /// Edit the flags of a message (only SUPPRESS_EMBEDS can currently be set/unset)
    public var flags: MessageFlags?
    
    /// Allowed mentions for the message
    public var allowedMentions: [AllowedMention]?
    
    /// Components to include with the message
    #warning("incomplete implementation")
//    public var components: array of message component
    
    /// Contents of the file being sent/edited. See Uploading Files
//    public var files[n]: file contents
    
    /// JSON-encoded body of non-file params (multipart/form-data only). See Uploading Files
//    public var payload_json: string
    
    /// Attached files to keep and possible descriptions for new files. See Uploading Files
    public var attachments: [Attachment]?
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case embeds = "embeds"
        case flags = "flags"
        case allowedMentions = "allowed_mentions"
        case attachments = "attachments"
    }
    
    public init(content: String? = nil, embeds: [Embed]? = nil, flags: MessageFlags? = nil, allowedMentions: [AllowedMention]? = nil, attachments: [Attachment]? = nil) {
        self.content = content
        self.embeds = embeds
        self.flags = flags
        self.allowedMentions = allowedMentions
        self.attachments = attachments
    }
    
    public static func edit(content: String? = nil,
                            embeds: [Embed]? = nil,
                            flags: MessageFlags? = nil,
                            allowedMentions: [AllowedMention]? = nil,
                            attachments: [Attachment]? = nil) -> Self {
        Self(content: content,
             embeds: embeds,
             flags: flags,
             allowedMentions: allowedMentions,
             attachments: attachments)
    }
}
