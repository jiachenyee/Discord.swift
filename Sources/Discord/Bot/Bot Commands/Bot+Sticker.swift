//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getSticker(_ stickerId: Snowflake) async throws -> Sticker {
        try await sendRequest(Sticker.self,
                              endpoint: "stickers/\(stickerId)")
    }
}
