//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct StickerPacks: Codable {
    public var stickerPacks: [StickerPack]
    
    enum CodingKeys: String, CodingKey {
        case stickerPacks = "sticker_packs"
    }
}
