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
                        on messageId: Snowflake,
                        reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/@me",
                              method: .delete)
    }
    
    func deleteUserReaction(inChannel channelId: Snowflake,
                            on messageId: Snowflake,
                            user: Snowflake,
                            reaction: ReactionEmoji) async throws {
        try await sendRequest(endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())/\(user)",
                              method: .delete)
    }
    
    func getReactions(inChannel channelId: Snowflake,
                      on messageId: Snowflake,
                      reaction: ReactionEmoji,
                      filteredBy query: ReactionFilter) async throws -> [User] {
        try await sendRequest([User].self,
                              endpoint: "/channels/\(channelId)/messages/\(messageId)/reactions/\(reaction.toURLComponent())",
                              parameters: query.toParameters())
    }
}
