//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    /// Look up information using an invite code.
    /// - Parameters:
    ///   - inviteCode: Invite code to lookup. E.g. discord.gg/`inviteCode`
    ///   - filters: Select additional information that should be included with the returned `Invite`.
    ///              By default, no additional information is included.
    /// - Returns: Returns an `Invite` object for the given code.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/invite#get-invite](https://discord.com/developers/docs/resources/invite#get-invite)
    func getInvite(withCode inviteCode: String,
                   including filters: InviteFilters = .using()) async throws -> Invite {
        try await sendRequest(Invite.self,
                              endpoint: "invites/\(inviteCode)",
                              parameters: filters.toParameters())
    }
    
    /// Delete an invite
    /// - Important: Requires the `MANAGE_CHANNELS` permission on the channel this invite belongs to, or `MANAGE_GUILD` to remove any invite across the guild.
    /// - Parameter inviteCode: Invite code to delete. E.g. discord.gg/`inviteCode`
    /// - Returns: Returns an `Invite` object on success. Fires an Invite Delete Gateway event.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/invite#delete-invite](https://discord.com/developers/docs/resources/invite#delete-invite)
    @discardableResult
    func deleteInvite(withCode inviteCode: String) async throws -> Invite {
        try await sendRequest(Invite.self,
                              endpoint: "invites/\(inviteCode)",
                              method: .delete)
    }
}
