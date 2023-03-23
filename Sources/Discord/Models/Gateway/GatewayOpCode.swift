//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 23/3/23.
//

import Foundation

enum GatewayOpCode: Int, Codable {
    /// Receive:    An event was dispatched.
    case dispatch = 0
    /// Send:/Receive    Fired periodically by the client to keep the connection alive.
    case heartbeat = 1
    /// Send:    Starts a new session during the initial handshake.
    case identify = 2
    /// Send:    Update the client's presence.
    case presenceUpdate = 3
    /// Send:    Used to join/leave or move between voice channels.
    case voiceStateUpdate = 4
    /// Send:    Resume a previous session that was disconnected.
    case resume = 6
    /// Receive:    You should attempt to reconnect and resume immediately.
    case reconnect = 7
    /// Send:    Request information about offline guild members in a large guild.
    case requestGuildMembers = 8
    /// Receive:    The session has been invalidated. You should reconnect and identify/resume accordingly.
    case invalidSession = 9
    /// Receive:    Sent immediately after connecting, contains the heartbeat_interval to use.
    case hello = 10
    /// Receive:    Sent in response to receiving a heartbeat to acknowledge that it has been received.
    case heartbeatACK = 11
}
