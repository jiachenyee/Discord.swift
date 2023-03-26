//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public struct StickerPack: Codable {
    /// id of the sticker pack
    public var id: Snowflake
    
    /// the stickers in the pack
    public var stickers: [Sticker]
    
    /// name of the sticker pack
    public var name: String
    
    /// id of the pack's SKU
    public var skuId: Snowflake
    
    /// id of a sticker in the pack which is shown as the pack's icon
    public var coverStickerId: Snowflake?
    
    /// description of the sticker pack
    public var description: String
    
    /// id of the sticker pack's banner image
    public var bannerAssetId: Snowflake?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case stickers = "stickers"
        case name = "name"
        case skuId = "sku_id"
        case coverStickerId = "cover_sticker_id"
        case description = "description"
        case bannerAssetId = "banner_asset_id"
    }
    
    public init(id: Snowflake,
                stickers: [Sticker],
                name: String,
                skuId: Snowflake,
                coverStickerId: Snowflake? = nil,
                description: String,
                bannerAssetId: Snowflake? = nil) {
        self.id = id
        self.stickers = stickers
        self.name = name
        self.skuId = skuId
        self.coverStickerId = coverStickerId
        self.description = description
        self.bannerAssetId = bannerAssetId
    }
}
