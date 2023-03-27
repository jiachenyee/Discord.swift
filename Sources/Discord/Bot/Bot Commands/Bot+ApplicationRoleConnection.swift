//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getRoleConnectionMetadataRecords(application applicationId: Snowflake)
    async throws -> [ApplicationRoleConnectionMetadata] {
        try await sendRequest([ApplicationRoleConnectionMetadata].self,
                              endpoint: "applications/\(applicationId)/role-connections/metadata")
    }
    
    @discardableResult
    func updateRoleConnectionMetadataRecords() async throws -> [ApplicationRoleConnectionMetadata] {
        try await sendRequest([ApplicationRoleConnectionMetadata].self,
                              endpoint: "applications/\(applicationId)/role-connections/metadata",
                              method: .put)
    }
}
