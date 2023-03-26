//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func getInvite(withCode inviteCode: String,
                   filtering filters: InviteFilters) async throws -> Invite {
        try await sendRequest(Invite.self,
                              endpoint: "invites/\(inviteCode)",
                              parameters: filters.toParameters())
    }
    
    func deleteInvite(withCode inviteCode: String) async throws {
        try await sendRequest(endpoint: "invites/\(inviteCode)",
                              method: .delete)
    }
}
