//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public struct InteractionResponse: Codable {
    /// the type of response
    public var type: InteractionCallbackType
    
    /// an optional response message
    public var data: InteractionCallbackData?
    
    public init(type: InteractionCallbackType,
                data: InteractionCallbackData? = nil) {
        self.type = type
        self.data = data
    }
}

public enum InteractionCallbackType: Int, Codable {
    /// ACK a Ping
    case pong = 1
    
    /// respond to an interaction with a message
    case channelMessageWithSource = 4
    
    /// ACK an interaction and edit a response later, the user sees a loading state
    case deferredChannelMessageWithSource = 5
    
    /// for components, ACK an interaction and edit the original message later; the user does not see a loading state
    case deferredUpdateMessage = 6
    
    /// for components, edit the message the component was attached to
    case updateMessage = 7
    
    /// respond to an autocomplete interaction with suggested choices
    case applicationCommandAutocompleteResult = 8
    
    /// respond to an interaction with a popup modal
    case modal = 9
}

public enum InteractionCallbackData: Codable {
    case message(InteractionMessage)
    case autocomplete(Autocomplete)
    case modal(Modal)
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .message(let message):
            try container.encode(message)
        case .autocomplete(let autocomplete):
            try container.encode(autocomplete)
        case .modal(let modal):
            try container.encode(modal)
        }
    }
}

public struct InteractionMessage: Codable {
    /// is the response TTS
    public var tts: Bool?
    
    /// message content
    public var content: String?
    
    /// supports up to 10 embeds
    public var embeds: [Embed]?
    
    /// allowed mentions object
    public var allowed_mentions: [AllowedMention]?
    
    /// message flags combined as a bitfield (only SUPPRESS_EMBEDS and EPHEMERAL can be set)
    public var flags: MessageFlags?
    
    /// message components
    public var components: [Component]?
    
    /// attachment objects with filename and description
    public var attachments: [Attachment]?
    
    public init(tts: Bool? = nil, content: String? = nil, embeds: [Embed]? = nil, allowed_mentions: [AllowedMention]? = nil, flags: MessageFlags? = nil, components: [Component]? = nil, attachments: [Attachment]? = nil) {
        self.tts = tts
        self.content = content
        self.embeds = embeds
        self.allowed_mentions = allowed_mentions
        self.flags = flags
        self.components = components
        self.attachments = attachments
    }
}

public struct Autocomplete: Codable {
    /// autocomplete choices (max of 25 choices)
    public var choices: [Command.OptionChoice]
    
    public init(choices: [Command.OptionChoice]) {
        self.choices = choices
    }
}

public struct Modal: Codable {
    /// a developer-defined identifier for the modal, max 100 characters
    public var custom_id: String
    
    /// the title of the popup modal, max 45 characters
    public var title: String
    
    /// between 1 and 5 (inclusive) components that make up the modal
    public var components: [Component]
    
    public init(custom_id: String, title: String, textInputs: [Component]) {
        let components = textInputs.map {
            Component.actionRow(components: [$0])
        }
        
        self.custom_id = custom_id
        self.title = title
        self.components = components
    }
}
