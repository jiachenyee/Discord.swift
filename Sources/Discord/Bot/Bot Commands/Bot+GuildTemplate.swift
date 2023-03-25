//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getGuildTemplate(code templateCode: String) async throws -> Data {
        try await sendRequest(
                              endpoint: "guilds/templates/\(templateCode)")
    }
}
