//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct SelectMenu: Codable {
    /// Type of select menu component (text: 3, user: 5, role: 6, mentionable: 7, channels: 8)
    public var type: SelectMenuComponentType
    
    /// ID for the select menu; max 100 characters
    public var customId: String
    
    /// Specified choices in a select menu (only required and available for string selects (type 3); max 25
    public var options: [SelectOption]?
    
    /// List of channel types to include in the channel select component (type 8)
    public var channelTypes: [ChannelType]?
    
    /// Placeholder text if nothing is selected; max 150 characters
    public var placeholder: String?
    
    /// Minimum number of items that must be chosen (defaults to 1); min 0, max 25
    public var minValues: Int?
    
    /// Maximum number of items that can be chosen (defaults to 1); max 25
    public var maxValues: Int?
    
    /// Whether select menu is disabled (defaults to false)
    public var disabled: Bool?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case customId = "custom_id"
        case options = "options"
        case channelTypes = "channel_types"
        case placeholder = "placeholder"
        case minValues = "min_values"
        case maxValues = "max_values"
        case disabled = "disabled"
    }
    
    init(type: SelectMenuComponentType,
         customId: String,
         options: [SelectOption]? = nil,
         channelTypes: [ChannelType]? = nil,
         placeholder: String? = nil,
         minValues: Int? = nil,
         maxValues: Int? = nil,
         disabled: Bool? = nil) {
        self.type = type
        self.customId = customId
        self.options = options
        self.channelTypes = channelTypes
        self.placeholder = placeholder
        self.minValues = minValues
        self.maxValues = maxValues
        self.disabled = disabled
    }
    
    public static func text(customId: String,
                            options: [SelectOption]? = nil,
                            placeholder: String? = nil,
                            minValues: Int? = nil,
                            maxValues: Int? = nil,
                            disabled: Bool? = nil) -> Self {
        Self(type: .textInput,
             customId: customId,
             options: options,
             placeholder: placeholder,
             minValues: minValues,
             maxValues: maxValues,
             disabled: disabled)
    }
    
    public static func role(customId: String,
                            placeholder: String? = nil,
                            minValues: Int? = nil,
                            maxValues: Int? = nil,
                            disabled: Bool? = nil) -> Self {
        Self(type: .roleSelect,
             customId: customId,
             placeholder: placeholder,
             minValues: minValues,
             maxValues: maxValues,
             disabled: disabled)
    }
    
    public static func user(customId: String,
                            placeholder: String? = nil,
                            minValues: Int? = nil,
                            maxValues: Int? = nil,
                            disabled: Bool? = nil) -> Self {
        Self(type: .userSelect,
             customId: customId,
             placeholder: placeholder,
             minValues: minValues,
             maxValues: maxValues,
             disabled: disabled)
    }
    
    public static func channels(customId: String,
                                channelTypes: [ChannelType] = [.guildAnnouncement,
                                                               .guildText,
                                                               .guildForum,
                                                               .guildVoice,
                                                               .guildCategory,
                                                               .guildDirectory,
                                                               .guildStageVoice,
                                                               .announcementThread,
                                                               .publicThread],
                                placeholder: String? = nil,
                                minValues: Int? = nil,
                                maxValues: Int? = nil,
                                disabled: Bool? = nil) -> Self {
        Self(type: .roleSelect,
             customId: customId,
             channelTypes: channelTypes,
             placeholder: placeholder,
             minValues: minValues,
             maxValues: maxValues,
             disabled: disabled)
    }
}
