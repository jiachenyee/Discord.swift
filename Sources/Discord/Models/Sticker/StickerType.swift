//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public enum StickerType: Int, Codable {
    /// an official sticker in a pack, part of Nitro or in a removed purchasable pack
    case standard = 1
    /// a sticker uploaded to a guild for the guild's members
    case guild = 2
}
