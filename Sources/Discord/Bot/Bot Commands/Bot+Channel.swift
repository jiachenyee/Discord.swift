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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#get-channel](https://discord.com/developers/docs/resources/channel#get-channel)
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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#modify-channel](https://discord.com/developers/docs/resources/channel#modify-channel)
    @discardableResult
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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#deleteclose-channel](https://discord.com/developers/docs/resources/channel#deleteclose-channel)
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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#get-channel-messages](https://discord.com/developers/docs/resources/channel#get-channel-messages)
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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#get-channel-message](https://discord.com/developers/docs/resources/channel#get-channel-message)
    func getChannelMessage(_ channelId: Snowflake,
                           messageId: Snowflake) async throws -> Data {
        try await sendRequest(
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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#create-message](https://discord.com/developers/docs/resources/channel#create-message)
    /// > Tip:  See [message formatting]([https://discord.com/developers/docs/reference#message-formatting](https://discord.com/developers/docs/reference#message-formatting)) for more information on how to properly format messages.
    @discardableResult
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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#crosspost-message](https://discord.com/developers/docs/resources/channel#crosspost-message)
    @discardableResult
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
    /// - Note: To use custom emoji, you must encode it in the format `[name:id](name:id)` with the emoji name and emoji ID.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#create-reaction](https://discord.com/developers/docs/resources/channel#create-reaction)
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
    /// - Note: To use custom emoji, you must encode it in the format `[name:id](name:id)` with the emoji name and emoji ID.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#delete-own-reaction](https://discord.com/developers/docs/resources/channel#delete-own-reaction)
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
    /// - Note: To use custom emoji, you must encode it in the format `[name:id](name:id)` with the emoji name and emoji ID.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#delete-user-reaction](https://discord.com/developers/docs/resources/channel#delete-user-reaction)
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
    /// - Note: To use custom emoji, you must encode it in the format `[name:id](name:id)` with the emoji name and emoji ID.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#get-reactions](https://discord.com/developers/docs/resources/channel#get-reactions)
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
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#delete-all-reactions](https://discord.com/developers/docs/resources/channel#delete-all-reactions)
    func deleteAllReactions(inChannel channelId: Snowflake,
                            onMessage messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions",
                              method: .delete)
    }
    
    /// Deletes all the reactions for a given emoji on a message.
    /// - Parameters:
    ///   - reaction: The reaction emoji to delete.
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    /// - Important: This endpoint requires the `MANAGE_MESSAGES` permission to be present on the current user.
    /// - Warning: The emoji must be URL Encoded or the request will fail with `10014: Unknown Emoji`.
    /// - Note: To use custom emoji, you must encode it in the format `[name:id](name:id)` with the emoji name and emoji ID.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#delete-all-reactions-for-emoji](https://discord.com/developers/docs/resources/channel#delete-all-reactions-for-emoji)
    func deleteAllReactions(forEmoji reaction: ReactionEmoji,
                            inChannel channelId: Snowflake,
                            onMessage messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())",
                              method: .delete)
    }
    
    /// Edit a previously sent message.
    ///
    /// The fields content, embeds, and flags can be edited by the original message author. Other users can only edit `flags` and only if they have the `MANAGE_MESSAGES` permission in the corresponding channel. When specifying `flags`, ensure to include all previously set flags/bits in addition to ones that you are modifying. Only `flags` documented in the table below may be modified by users (unsupported `flag` changes are currently ignored without error).
    ///
    /// When the `content` field is edited, the `mentions` array in the message object will be reconstructed from scratch based on the new content. The `allowed_mentions` field of the edit request controls how this happens. If there is no explicit `allowed_mentions` in the edit request, the content will be parsed with default allowances, that is, without regard to whether or not an `allowed_mentions` was present in the request that originally created the message.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    ///   - editedContents: The modified content of the target message.
    /// - Returns: Returns a message object. Fires a Message Update Gateway event.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#edit-message](https://discord.com/developers/docs/resources/channel#edit-message)
    @discardableResult
    func editMessage(channel channelId: Snowflake,
                     message messageId: Snowflake,
                     editedContents: MessageEdit) async throws -> Message {
        try await sendRequest(Message.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)",
                              method: .patch,
                              data: editedContents)
    }
    
    /// Deletes a message.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    /// - Note: If operating on a guild channel and trying to delete a message that was not sent by the current user, this endpoint requires the `MANAGE_MESSAGES` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#delete-message](https://discord.com/developers/docs/resources/channel#delete-message)
    func deleteMessage(channel channelId: Snowflake,
                       message messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)",
                              method: .delete)
    }
    
    /// Delete multiple messages in a single request.
    ///
    /// Any message IDs given that do not exist or are invalid will count towards the minimum and maximum message count (currently 2 and 100 respectively).
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel. 
    ///   - bulkDeleteMessages: The array of message IDs to be deleted.
    /// - Important: This endpoint can only be used on guild channels and requires the `MANAGE_MESSAGES` permission. It will not delete messages older than 2 weeks, and will fail with a 400 BAD REQUEST if any message provided is older than that or if any duplicate message IDs are provided.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#bulk-delete-messages](https://discord.com/developers/docs/resources/channel#bulk-delete-messages)
    func bulkDeleteMessages(channel channelId: Snowflake,
                            bulkDelete bulkDeleteMessages: BulkDeleteMessages) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/bulk-delete",
                              method: .post,
                              data: bulkDeleteMessages)
    }
    
    /// Edit the channel permission overwrites for a user or role in a channel.
    ///
    /// Only usable for guild channels.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - overwriteId: The overwrite ID of the permissions.
    ///   - permission: The specifications of the permissions to be overwritten.
    /// - Important: Requires the `MANAGE_ROLES` permission.
    /// > Disord Reference: [https://discord.com/developers/docs/resources/channel#edit-channel-permissions](https://discord.com/developers/docs/resources/channel#edit-channel-permissions)
    func editChannelPermission(channel channelId: Snowflake,
                               overwrite overwriteId: Snowflake,
                               permission: ChannelPermission) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/permissions/\(overwriteId)",
                              method: .put,
                              data: permission)
    }
    
    /// Delete a channel permission overwrite for a user or role in a channel.
    ///
    /// Only usable for guild channels.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - overwriteId: The overwrite ID of the permissions.
    /// - Important: Requires the `MANAGE_ROLES` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#delete-channel-permission](https://discord.com/developers/docs/resources/channel#delete-channel-permission)
    func deleteChannelPermission(channel channelId: Snowflake,
                                 overwrite overwriteId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/permissions/\(overwriteId)",
                              method: .delete)
    }
    
    /// Returns a list of invite objects (with invite metadata) for the channel.
    ///
    /// Only usable for guild channels.
    /// - Parameter channelId: The channel ID of the target channel.
    /// - Returns: Returns an array of invite objects.
    /// - Important: Requires the `MANAGE_CHANNELS` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#get-channel-invites](https://discord.com/developers/docs/resources/channel#get-channel-invites)
    func getChannelInvites(channel channelId: Snowflake) async throws -> [Invite] {
        try await sendRequest([Invite].self,
                              endpoint: "/channels/\(channelId)/invites")
    }
    
    /// Create a new invite object for the channel.
    ///
    /// Only usable for guild channels.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - channelInvite: The specifications of the channel invite.
    /// - Returns: Returns an invite object.
    /// - Important: Requires the `CREATE_INSTANT_INVITE` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#create-channel-invite](https://discord.com/developers/docs/resources/channel#create-channel-invite)
    @discardableResult
    func createChannelInvite(channel channelId: Snowflake,
                             invite channelInvite: ChannelInvite) async throws -> Invite {
        try await sendRequest(Invite.self,
                              endpoint: "/channels/\(channelId)/invites", method: .post,
                              data: channelInvite)
    }
    
    
    /// Follow an Announcement Channel to send messages to a target channel.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - announcementChannel: The webhook ID of the announcement channel. 
    /// - Returns: Returns a followed channel object. Fires a Webhooks Update Gateway event for the target channel.
    /// - Important: Requires the `MANAGE_WEBHOOKS` permission in the target channel.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#follow-announcement-channel](https://discord.com/developers/docs/resources/channel#follow-announcement-channel)
    func followAnnouncementChannel(channel channelId: Snowflake,
                                   announcementChannel: FollowChannel) async throws -> FollowedChannel {
        try await sendRequest(FollowedChannel.self,
                              endpoint: "/channels/\(channelId)/followers",
                              method: .post,
                              data: announcementChannel)
    }
    
    /// Post a typing indicator for the specified channel.
    ///
    /// Generally bots should not implement this route. However, if a bot is responding to a command and expects the computation to take a few seconds, this endpoint may be called to let the user know that the bot is processing their message.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#trigger-typing-indicator](https://discord.com/developers/docs/resources/channel#trigger-typing-indicator)
    func triggerTypingIndicator(channel channelId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/typing",
                              method: .post)
    }
    
    /// Gets all the pinned messages of a channel.
    /// - Parameter channelId: The channel ID of the target channel.
    /// - Returns: Returns all pinned messages in the channel as an array of message objects.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#get-pinned-messages](https://discord.com/developers/docs/resources/channel#get-pinned-messages)
    func getPinnedMessages(channel channelId: Snowflake) async throws -> [Message] {
        try await sendRequest([Message].self,
                              endpoint: "/channels/\(channelId)/pins",
                              method: .post)
    }
    
    /// Pin a message in the channel.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the targte message.
    /// - Important: Requires the `MANAGE_MESSAGES` permission. The maximum amount of pinned messages in a channel is 50.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#pin-message](https://discord.com/developers/docs/resources/channel#pin-message)
    func pinMessage(channel channelId: Snowflake,
                    message messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/pins/\(messageId)",
                              method: .put)
    }
    
    /// Unpin a message in the channel.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the targte message.
    /// - Important: Requires the `MANAGE_MESSAGES` permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#unpin-message](https://discord.com/developers/docs/resources/channel#unpin-message)
    func unpinMessage(channel channelId: Snowflake,
                      message messageId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/pins/\(messageId)",
                              method: .delete)
    }
    
    /// Adds a recipient to a Group DM using their access token.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - userId: The user ID of the target user.
    ///   - recipientInfo: The information of the user added, including their nickname and access token.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#group-dm-add-recipient](https://discord.com/developers/docs/resources/channel#group-dm-add-recipient)
    func groupDMAdd(groupDM channelId: Snowflake,
                    recipient userId: Snowflake,
                    recipientInfo: GroupDMRecipient) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/recipients/\(userId)",
                              method: .put,
                              data: recipientInfo)
    }
    
    /// Removes a recipient from a Group DM.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - userId: The user ID of the target user.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#group-dm-remove-recipient](https://discord.com/developers/docs/resources/channel#group-dm-remove-recipient)
    func groupDMRemove(groupDM channelId: Snowflake,
                       recipient userId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/recipients/\(userId)",
                              method: .delete)
    }
    
    /// Creates a new thread from an existing message.
    ///
    /// When called on a `GUILD_TEXT` channel, creates a `PUBLIC_THREAD`. When called on a `GUILD_ANNOUNCEMENT` channel, creates a `ANNOUNCEMENT_THREAD`. Does not work on a `GUILD_FORUM` channel. The id of the created thread will be the same as the id of the source message, and as such a message can only have a single thread created from it.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - messageId: The message ID of the target message.
    ///   - threadInfo: The specifications of the threat created.
    /// - Returns: Returns a channel on success, and a 400 BAD REQUEST on invalid parameters. Fires a Thread Create and a Message Update Gateway event.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#start-thread-from-message](https://discord.com/developers/docs/resources/channel#start-thread-from-message)
    @discardableResult
    func startThread(channel channelId: Snowflake,
                     message messageId: Snowflake,
                     threadInfo: NewThreadInformation) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)/threads",
                              method: .post,
                              data: threadInfo)
    }
    
    /// Creates a new thread that is not connected to an existing message.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - threadInfo: The specifications of the threat created.
    /// - Returns: Returns a channel on success, and a 400 BAD REQUEST on invalid parameters. Fires a Thread Create Gateway event.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#start-thread-without-message](https://discord.com/developers/docs/resources/channel#start-thread-without-message)
    @discardableResult
    func startThread(channel channelId: Snowflake,
                     threadInfo: NewChannelThreadInformation) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)/threads",
                              method: .post,
                              data: threadInfo)
    }
    
    /// Creates a new thread in a forum channel, and sends a message within the created thread.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - postInfo: The specifications of the new post.
    /// - Returns: Returns a channel, with a nested message object, on success, and a 400 BAD REQUEST on invalid parameters. Fires a Thread Create and Message Create Gateway event.
    /// - Note: The type of the created thread is `PUBLIC_THREAD`.
    /// - Important: The current user must have the `SEND_MESSAGES` permission (`CREATE_PUBLIC_THREADS` is ignored).
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#start-thread-in-forum-channel](https://discord.com/developers/docs/resources/channel#start-thread-in-forum-channel)
    @discardableResult
    func startForumThread(channel channelId: Snowflake,
                          postInfo: NewForumThread) async throws -> Channel {
        try await sendRequest(Channel.self,
                              endpoint: "/channels/\(channelId)/threads",
                              method: .post,
                              data: postInfo)
    }
    
    /// Adds the current user to a thread.
    ///
    /// Also requires the thread to be not archived.
    /// - Parameter threadId: The thread ID of the target thread.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#join-thread](https://discord.com/developers/docs/resources/channel#join-thread)
    func joinThread(_ threadId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/@me",
                              method: .put)
    }
    
    /// Adds another member to a thread.
    ///
    /// Requires the ability to send messages in the thread. Also requires the thread to be not archived.
    /// - Parameters:
    ///   - threadId: The thread ID of the target thread.
    ///   - userId: The user ID of the target user.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#add-thread-member](https://discord.com/developers/docs/resources/channel#add-thread-member)
    func addThreadMember(_ threadId: Snowflake,
                         user userId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/\(userId)",
                              method: .put)
    }
    
    /// Removes the current user from a thread.
    ///
    /// Also requires the thread to be not archived.
    /// - Parameter threadId: The thread ID of the target thread.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#leave-thread](https://discord.com/developers/docs/resources/channel#leave-thread)
    func leaveThread(_ threadId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/@me",
                              method: .delete)
    }
    
    /// Removes another member from a thread.
    ///
    /// Also requires the thread to be not archived.
    /// - Parameters:
    ///   - threadId: The thread ID of the target thread.
    ///   - userId: The user ID of the target user.
    /// - Important: Requires the  `MANAGE_THREADS` permission, or the creator of the thread if it is a `PRIVATE_THREAD`.
    ///   > Discord Reference: [https://discord.com/developers/docs/resources/channel#remove-thread-member](https://discord.com/developers/docs/resources/channel#remove-thread-member)
    func removeThreadMember(_ threadId: Snowflake,
                            user userId: Snowflake) async throws {
        try await sendRequest(endpoint: "/channels/\(threadId)/thread-members/\(userId)",
                              method: .delete)
    }
    
    /// Get the member of the thread, given that they are a member of the thread.
    /// - Parameters:
    ///   - threadId: The thread ID of the target thread.
    ///   - userId: The user ID of the target user.
    ///   - withGuildMember: Boolean value. If `true`, the thread member object that is returned will include a `member` field containing a guild member object.
    /// - Returns: Returns a thread member object for the specified user if they are a member of the thread, returns a 404 response otherwise.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#get-thread-member](https://discord.com/developers/docs/resources/channel#get-thread-member)
    func getThreadMember(_ threadId: Snowflake,
                         user userId: Snowflake,
                         withGuildMember: Bool = false) async throws -> ThreadMember {
        try await sendRequest(ThreadMember.self,
                              endpoint: "/channels/\(threadId)/thread-members/\(userId)",
                              parameters: ["with_member": withGuildMember])
    }
    
    /// Get a list of members in the thread.
    /// - Parameters:
    ///   - threadId: The thread ID of the target thread.
    ///   - filters: The filters applied to the returned thread members.
    /// - Returns: Returns array of thread members objects that are members of the thread.
    /// - Important: This endpoint is restricted according to whether the `GUILD_MEMBERS` Privileged Intent is enabled for your application.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#list-thread-members](https://discord.com/developers/docs/resources/channel#list-thread-members)
    func listThreadMembers(_ threadId: Snowflake,
                           filtered filters: ThreadMemberFilters = .using()) async throws -> [ThreadMember] {
        try await sendRequest([ThreadMember].self,
                              endpoint: "/channels/\(threadId)/thread-members",
                              parameters: filters.toParameters())
    }
    
    /// Get a list of archived public threads in the given channel.
    ///
    /// When called on a `GUILD_TEXT` channel, returns threads of type `PUBLIC_THREAD`. When called on a `GUILD_ANNOUNCEMENT` channel returns threads of type `ANNOUNCEMENT_THREAD`. Threads are ordered by `archive_timestamp`, in descending order.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - filters: The filters applied to the returned list of archived threads.
    /// - Returns: Returns archived threads in the channel that are public.
    /// - [Important:Requires](Important:Requires) the `READ_MESSAGE_HISTORY `permission.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#list-public-archived-threads](https://discord.com/developers/docs/resources/channel#list-public-archived-threads)
    func listPublicArchivedThreads(channel channelId: Snowflake,
                                   filtered filters: ArchivedThreadFilter) async throws -> ArchivedThreads {
        try await sendRequest(ArchivedThreads.self,
                              endpoint: "/channels/\(channelId)/threads/archived/public",
                              parameters: filters.toParameters())
    }
    
    /// Get a list of archived private threads in the given channel.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - filters: The filters applied to the returned list of archived threads.
    /// - Returns: Returns archived threads in the channel that are of type `PRIVATE_THREAD`.
    /// - Important: Requires both the `READ_MESSAGE_HISTORY` and `MANAGE_THREADS` permissions.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#list-private-archived-threads](https://discord.com/developers/docs/resources/channel#list-private-archived-threads)
    func listPrivateArchivedThreads(channel channelId: Snowflake,
                                    filtered filters: ArchivedThreadFilter) async throws -> ArchivedThreads {
        try await sendRequest(ArchivedThreads.self,
                              endpoint: "/channels/\(channelId)/threads/archived/private",
                              parameters: filters.toParameters())
    }
    
    /// Get a list of archived private threads that the user has joined in the given channel.
    /// - Parameters:
    ///   - channelId: The channel ID of the target channel.
    ///   - filters: The filters applied to the returned list of archived threads.
    /// - Returns: Returns archived threads in the channel that are of type `PRIVATE_THREAD`.
    /// > Discord Reference: [https://discord.com/developers/docs/resources/channel#list-joined-private-archived-threads](https://discord.com/developers/docs/resources/channel#list-joined-private-archived-threads)
    func listJoinedPrivateArchivedThreads(channel channelId: Snowflake,
                                          filtered filters: ArchivedThreadFilter) async throws -> ArchivedThreads {
        try await sendRequest(ArchivedThreads.self,
                              endpoint: "/channels/\(channelId)/users/@me/threads/archived/private",
                              parameters: filters.toParameters())
    }
}
