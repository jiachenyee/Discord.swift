//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct MessageRequest: Codable {
    
    /// Message contents (up to 2000 characters)
    public var content: String?
    
    /// Can be used to verify a message was sent (up to 25 characters). Value will appear in the Message Create event.
    public var nonce: Nonce?
    
    /// true if this is a TTS message
    public var tts: Bool?
    
    /// Up to 10 rich embeds (up to 6000 characters)
    public var embeds: [Embed]?
    
    /// Allowed mentions for the message
    public var allowed_mentions: [AllowedMention]?
     
    /// Include to make your message a reply
    public var message_reference: MessageReference?
     
    #warning("Incomplete implementation")
    /// Components to include with the message
//    public var components?*    array of message component objects
//     public var sticker_ids?*    array of snowflakes    IDs of up to 3 stickers in the server to send in the message
//     public var files[n]?*    file contents    Contents of the file being sent. See Uploading Files
//     public var payload_json?    string    JSON-encoded body of non-file params, only for multipart/form-data requests. See Uploading Files
    
    /// Attachment objects with filename and description. See Uploading Files
    public var attachments: [Attachment]?
    
    /// Message flags combined as a bitfield (only SUPPRESS_EMBEDS and SUPPRESS_NOTIFICATIONS can be set)
    public var flags: MessageFlags?
    
    public init(content: String? = nil,
                nonce: Nonce? = nil,
                tts: Bool? = nil,
                embeds: [Embed]? = nil,
                allowed_mentions: [AllowedMention]? = nil,
                message_reference: MessageReference? = nil,
                attachments: [Attachment]? = nil,
                flags: MessageFlags? = nil) {
        self.content = content
        self.nonce = nonce
        self.tts = tts
        self.embeds = embeds
        self.allowed_mentions = allowed_mentions
        self.message_reference = message_reference
        self.attachments = attachments
        self.flags = flags
    }
    
    public static func create(content: String? = nil,
                              nonce: Nonce? = nil,
                              tts: Bool? = nil,
                              embeds: [Embed]? = nil,
                              allowed_mentions: [AllowedMention]? = nil,
                              message_reference: MessageReference? = nil,
                              attachments: [Attachment]? = nil,
                              flags: MessageFlags? = nil) -> Self {
        Self(content: content,
             nonce: nonce,
             tts: tts,
             embeds: embeds,
             allowed_mentions: allowed_mentions,
             message_reference: message_reference,
             attachments: attachments,
             flags: flags)
    }
}
