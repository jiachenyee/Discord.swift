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
    public var allowedMentions: [AllowedMention]?
    public var components: [Component]?
    public var stickerIds: [Snowflake]?
    
#warning("Incomplete implementation")
    //    public var files[n]*
    //    public var payload_json?
    
    public var attachments: [Attachment]?
    public var flags: MessageFlags?
    
    public init(content: String? = nil,
                embeds: [Embed]? = nil,
                allowedMentions: [AllowedMention]? = nil,
                components: [Component]? = nil,
                stickerIds: [Snowflake]? = nil,
                attachments: [Attachment]? = nil,
                flags: MessageFlags? = nil) {
        self.content = content
        self.embeds = embeds
        self.allowedMentions = allowedMentions
        self.components = components
        self.stickerIds = stickerIds
        self.attachments = attachments
        self.flags = flags
    }
    
    enum CodingKeys: String, CodingKey {
        case content = "content"
        case embeds = "embeds"
        case allowedMentions = "allowed_mentions"
        case components = "components"
        case stickerIds = "sticker_ids"
        case attachments = "attachments"
        case flags = "flags"
    }
}
