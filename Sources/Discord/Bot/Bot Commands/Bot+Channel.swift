//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension Bot {
    func getChannel(_ channelId: Snowflake) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)")
    }
    
    func modifyChannel(_ channelId: Snowflake,
                       updatedProperties: ChannelUpdateRequest) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)",
                              method: .patch,
                              data: updatedProperties)
    }
    
    func deleteChannel(_ channelId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)",
                              method: .delete)
    }
    
    func getChannelMessages(_ channelId: Snowflake,
                            using filters: ChannelMessageFilter = .filters()) async throws -> [Message] {
        try await sendRequest([Message].self,
                              endpoint: "/channels/\(channelId)/messages",
                              parameters: filters.toParameters())
    }
    
    func getChannelMessage(_ channelId: Snowflake,
                           messageId: Snowflake) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)")
    }
    
    func sendMessage(in channelId: Snowflake,
                     message: MessageRequest) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages",
                              method: .post,
                              data: message)
    }
    
    func crosspostMessage(in channelId: Snowflake,
                          messageId: Snowflake) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)/crosspost",
                              method: .post)
    }
    
    func addReaction(inChannel channelId: Snowflake,
                     toMessage messageId: Snowflake,
                     reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/@me",
                              method: .put)
    }
    
    func deleteReaction(inChannel channelId: Snowflake,
                        onMessage messageId: Snowflake,
                        reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/@me",
                              method: .delete)
    }
    
    func deleteUserReaction(inChannel channelId: Snowflake,
                            onMessage messageId: Snowflake,
                            user: Snowflake,
                            reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/\(user)",
                              method: .delete)
    }
    
    func getReactions(inChannel channelId: Snowflake,
                      onMessage messageId: Snowflake,
                      reaction: ReactionEmoji,
                      filteredBy query: ReactionFilter = .using()) async throws -> [User] {
        try await sendRequest([User].self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())",
                              parameters: query.toParameters())
    }
    
    func deleteAllReactions(inChannel channelId: Snowflake,
                            onMessage messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions",
                              method: .delete)
    }
    
    func deleteAllReactions(forEmoji reaction: ReactionEmoji,
                            inChannel channelId: Snowflake,
                            onMessage messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())",
                              method: .delete)
    }
    
    func editMessage(channel channelId: Snowflake,
                     message messageId: Snowflake,
                     editedContents: MessageEdit) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)",
                              method: .patch,
                              data: editedContents)
    }
    
    func deleteMessage(channel channelId: Snowflake,
                       message messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)",
                              method: .delete)
    }
    
    func bulkDeleteMessages(channel channelId: Snowflake,
                            bulkDelete bulkDeleteMessages: BulkDeleteMessages) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/bulk-delete",
                              method: .post,
                              data: bulkDeleteMessages)
    }
    
    func editChannelPermission(channel channelId: Snowflake,
                               overwrite overwriteId: Snowflake,
                               permission: ChannelPermission) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/permissions/\(overwriteId)",
                              method: .put,
                              data: permission)
    }
    
    func deleteChannelPermission(channel channelId: Snowflake,
                                 overwrite overwriteId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/permissions/\(overwriteId)",
                              method: .delete)
    }
    
    func getChannelInvites(channel channelId: Snowflake) async throws -> [Invite] {
        try await sendRequest([Invite].self,
                              endpoint: "/channels/\(channelId)/invites")
    }
    
    func createChannelInvite(channel channelId: Snowflake,
                             invite channelInvite: ChannelInvite) async throws -> Invite {
        try await sendRequest(Invite.self,
                              endpoint: "/channels/\(channelId)/invites", method: .post,
                              data: channelInvite)
    }
    
    func followAnnouncementChannel(channel channelId: Snowflake,
                                   announcementChannel: FollowChannel) async throws -> FollowedChannel {
        try await sendRequest(FollowedChannel.self,
                              endpoint: "/channels/\(channelId)/followers",
                              method: .post,
                              data: announcementChannel)
    }
    
    func triggerTypingIndicator(channel channelId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/typing",
                              method: .post)
    }
    
    func getPinnedMessages(channel channelId: Snowflake) async throws -> [Message] {
        try await sendRequest([Message].self,
                              endpoint: "/channels/\(channelId)/pins",
                              method: .post)
    }
    
    func pinMessage(channel channelId: Snowflake,
                    message messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/pins/\(messageId)",
                              method: .put)
    }
    
    func unpinMessage(channel channelId: Snowflake,
                      message messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/pins/\(messageId)",
                              method: .delete)
    }
    
    func groupDMAdd(groupDM channelId: Snowflake,
                    recipient userId: Snowflake,
                    recipientInfo: GroupDMRecipient) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/recipients/\(userId)",
                              method: .put,
                              data: recipientInfo)
    }
    
    func groupDMRemove(groupDM channelId: Snowflake,
                       recipient userId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/recipients/\(userId)",
                              method: .delete)
    }
    
    func startThread(channel channelId: Snowflake,
                     message messageId: Snowflake,
                     threadInfo: NewThreadInformation) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)/threads",
                              method: .post,
                              data: threadInfo)
    }
    
    func startThread(channel channelId: Snowflake,
                     threadInfo: NewChannelThreadInformation) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)/threads",
                              method: .post,
                              data: threadInfo)
    }
    
    func startForumThread(channel channelId: Snowflake,
                          postInfo: NewForumThread) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)/threads",
                              method: .post,
                              data: postInfo)
    }
    
    func joinThread(_ threadId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/@me",
                              method: .put)
    }
    
    func addThreadMember(_ threadId: Snowflake,
                         user userId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/\(userId)",
                              method: .put)
    }
    
    func leaveThread(_ threadId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/@me",
                              method: .delete)
    }
    
    func removeThreadMember(_ threadId: Snowflake,
                            user userId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/\(userId)",
                              method: .delete)
    }
    
    func getThreadMember(_ threadId: Snowflake,
                         user userId: Snowflake,
                         withGuildMember: Bool = false) async throws -> ThreadMember {
        try await sendRequest(ThreadMember.self,
                              endpoint: "/channels/\(threadId)/thread-members/\(userId)",
                              parameters: ["with_member": withGuildMember])
    }
    
    func listThreadMember(_ threadId: Snowflake,
                          user userId: Snowflake,
                          filtered filters: ThreadMemberFilters) async throws -> [ThreadMember] {
        try await sendRequest([ThreadMember].self,
                              endpoint: "/channels/\(threadId)/thread-members",
                              parameters: filters.toParameters())
    }
}
