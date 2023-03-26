//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func listVoiceRegions() async throws -> [VoiceRegion] {
        try await sendRequest([VoiceRegion].self,
                              endpoint: "voice/regions")
    }
}
