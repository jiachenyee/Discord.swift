//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

public extension Bot {
    /// Get a channel by ID.
    /// - Parameter channelId: The channel ID of the target channel.
    /// - Returns: Returns a channel object. If the channel is a thread, a thread member object is included in the returned result.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#get-channel
    func getChannel(_ channelId: Snowflake) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)")
    }
    
    /// Update a channel's settings.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - updatedProperties: The properties and specifications
    /// - Returns: Returns a channel on success, and a 400 BAD REQUEST on invalid parameters.
    /// - Note: This endpoint supports the `X-Audit-Log-Reason` header.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#modify-channel
    func modifyChannel(_ channelId: Snowflake,
                       updatedProperties: ChannelUpdateRequest) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)",
                              method: .patch,
                              data: updatedProperties)
    }
    
    /// Delete a channel, or close a private message.
    ///
    /// Requires the `MANAGE_CHANNELS` permission for the guild, or `MANAGE_THREADS` if the channel is a thread. Deleting a category does not delete its child channels; they will have their `parent_id` removed and a Channel Update Gateway event will fire for each of them.
    ///
    /// - Parameter channelId: The channel ID of the target channel.
    /// - Warning: Deleting a guild channel cannot be undone. Use this with caution, as it is impossible to undo this action when performed on a guild channel. In contrast, when used with a private message, it is possible to undo the action by opening a private message with the recipient again.
    /// - Note: For Community guilds, the Rules or Guidelines channel and the Community Updates channel cannot be deleted.
    /// - Note: This endpoint supports the `X-Audit-Log-Reason` header.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#deleteclose-channel
    func deleteChannel(_ channelId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)",
                              method: .delete)
    }
    
    /// Retrieves the messages in a channel.
    ///
    /// If operating on a guild channel, this endpoint requires the current user to have the `VIEW_CHANNEL` permission. If the channel is a voice channel, they must also have the `CONNECT` permission.
    ///
    /// If the current user is missing the `READ_MESSAGE_HISTORY` permission in the channel, then no messages will be returned.
    ///
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - filters: The filters applied to the returned channel messages.
    /// - Returns: Returns an array of message objects on success.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#get-channel-messages
    func getChannelMessages(_ channelId: Snowflake,
                            using filters: ChannelMessageFilter = .filters()) async throws -> [Message] {
        try await sendRequest([Message].self,
                              endpoint: "/channels/\(channelId)/messages",
                              parameters: filters.toParameters())
    }
    
    /// Retrieves a specific message in a channel.
    ///
    /// If operating on a guild channel, this endpoint requires the current user to have the `VIEW_CHANNEL` and `READ_MESSAGE_HISTORY` permissions. If the channel is a voice channel, they must also have the `CONNECT permission`.
    ///
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    /// - Returns: Returns a message object on success.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#get-channel-message
    func getChannelMessage(_ channelId: Snowflake,
                           messageId: Snowflake) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)")
    }
    
    /// Sends a message to guild text or DM channel.
    ///
    /// To create a message as a reply to another message, apps can include a `message_reference` with a `message_id`. The `channel_id `and `guild_id `in the `message_reference` are optional, but will be validated if provided.
    ///
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - message: The content of the message sent.
    /// - Returns: Returns a message object. Fires a Message Create Gateway event.
    /// - Note: This function has limitations, such as certain permissions that the user needs to have under specific contexts. Visit Discord Reference (linked below) for a full list of limitations.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#create-message
    /// > Tip:  See [message formatting](https://discord.com/developers/docs/reference#message-formatting) for more information on how to properly format messages.
    func sendMessage(in channelId: Snowflake,
                     message: MessageRequest) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages",
                              method: .post,
                              data: message)
    }
    
    /// Crosspost a message in an Announcement Channel to following channels.
    ///
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    /// - Returns: Returns a message object. Fires a Message Update Gateway event.
    /// - Important: This endpoint requires the `SEND_MESSAGES` permission, if the current user sent the message, or additionally the `MANAGE_MESSAGES` permission, for all other messages, to be present for the current user.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#crosspost-message
    func crosspostMessage(in channelId: Snowflake,
                          messageId: Snowflake) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)/crosspost",
                              method: .post)
    }
    
    /// Create a reaction for the message.
    /// - Parameters:
    ///   - channelId: The channel ID of the channel where the message is in.
    ///   - messageId: The message ID of the message to add a reaction to.
    ///   - reaction: The reaction emoji.
    /// - Important: This endpoint requires the `READ_MESSAGE_HISTORY` permission to be present on the current user. Additionally, if nobody else has reacted to the message using this emoji, this endpoint requires the `ADD_REACTIONS` permission to be present on the current user.
    /// - Warning: The emoji must be URL Encoded or the request will fail with `10014: Unknown Emoji`.
    /// - Note: To use custom emoji, you must encode it in the format `name:id` with the emoji name and emoji ID.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#create-reaction
    func addReaction(inChannel channelId: Snowflake,
                     toMessage messageId: Snowflake,
                     reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/@me",
                              method: .put)
    }
    
    /// Delete a reaction the current user has made for the message.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    ///   - reaction: The reaction emoji to delete.
    /// - Warning: The emoji must be URL Encoded or the request will fail with `10014: Unknown Emoji`.
    /// - Note: To use custom emoji, you must encode it in the format `name:id` with the emoji name and emoji ID.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#delete-own-reaction
    func deleteReaction(inChannel channelId: Snowflake,
                        onMessage messageId: Snowflake,
                        reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/@me",
                              method: .delete)
    }
    
    /// Deletes the reaction of another user.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    ///   - user: The user ID of the target user.
    ///   - reaction: The reaction emoji to delete.
    /// - Important: This endpoint requires the `MANAGE_MESSAGES` permission to be present on the current user.
    /// - Warning: The emoji must be URL Encoded or the request will fail with `10014: Unknown Emoji`.
    /// - Note: To use custom emoji, you must encode it in the format `name:id` with the emoji name and emoji ID.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#delete-user-reaction
    func deleteUserReaction(inChannel channelId: Snowflake,
                            onMessage messageId: Snowflake,
                            user: Snowflake,
                            reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/\(user)",
                              method: .delete)
    }
    
    /// Get a list of users that reacted with this emoji.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    ///   - reaction: The reaction emoji to check.
    ///   - query: The specifics of the query.
    /// - Returns: Returns an array of user objects on success.
    /// - Warning: The emoji must be URL Encoded or the request will fail with `10014: Unknown Emoji`.
    /// - Note: To use custom emoji, you must encode it in the format `name:id` with the emoji name and emoji ID.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#get-reactions
    func getReactions(inChannel channelId: Snowflake,
                      onMessage messageId: Snowflake,
                      reaction: ReactionEmoji,
                      filteredBy query: ReactionFilter = .using()) async throws -> [User] {
        try await sendRequest([User].self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())",
                              parameters: query.toParameters())
    }
    
    /// Deletes all reactions on a message.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    /// - Important: This endpoint requires the `MANAGE_MESSAGES` permission to be present on the current user.
    /// > Discord Reference: https://discord.com/developers/docs/resources/channel#delete-all-reactions
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
    
    func listThreadMembers(_ threadId: Snowflake,
                           filtered filters: ThreadMemberFilters = .using()) async throws -> [ThreadMember] {
        try await sendRequest([ThreadMember].self,
                              endpoint: "/channels/\(threadId)/thread-members",
                              parameters: filters.toParameters())
    }
    
    func listPublicArchivedThreads(channel channelId: Snowflake,
                                   filtered filters: ArchivedThreadFilter) async throws -> ArchivedThreads {
        try await sendRequest(ArchivedThreads.self,
                              endpoint: "/channels/\(channelId)/threads/archived/public",
                              parameters: filters.toParameters())
    }
    
    func listPrivateArchivedThreads(channel channelId: Snowflake,
                                    filtered filters: ArchivedThreadFilter) async throws -> ArchivedThreads {
        try await sendRequest(ArchivedThreads.self,
                              endpoint: "/channels/\(channelId)/threads/archived/private",
                              parameters: filters.toParameters())
    }
    
    func listJoinedPrivateArchivedThreads(channel channelId: Snowflake,
                                          filtered filters: ArchivedThreadFilter) async throws -> ArchivedThreads {
        try await sendRequest(ArchivedThreads.self,
                              endpoint: "/channels/\(channelId)/users/@me/threads/archived/private",
                              parameters: filters.toParameters())
    }
}
