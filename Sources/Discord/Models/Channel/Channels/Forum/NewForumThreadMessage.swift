//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct NewForumThreadMessage: Codable {
    public var content: String?
    public var embeds: [Embed]?
    public var allowed_mentions: [AllowedMention]?
    
#warning("Incomplete implementation")
    //    public var components?*
    public var sticker_ids: [Snowflake]?
    
    //    public var files[n]*
    //    public var payload_json?
    public var attachments: [Attachment]?
    public var flags: MessageFlags?
    
    public init(content: String? = nil, embeds: [Embed]? = nil, allowed_mentions: [AllowedMention]? = nil, attachments: [Attachment]? = nil, flags: MessageFlags? = nil) {
        self.content = content
        self.embeds = embeds
        self.allowed_mentions = allowed_mentions
        self.attachments = attachments
        self.flags = flags
    }
}
