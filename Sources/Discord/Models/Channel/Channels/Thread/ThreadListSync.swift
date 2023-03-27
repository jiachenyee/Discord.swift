//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct ThreadListSync: GatewayEventData {
    /// ID of the guild
    public var guild_id: Snowflake
    
    /// Parent channel IDs whose threads are being synced. If omitted, then threads were synced for the entire guild. This array may contain channel_ids that have no active threads as well, so you know to clear that data.
    public var channel_ids: [Snowflake]?
    
    /// All active threads in the given channels that the current user can access
    public var threads: [Channel]
    
    /// All thread member objects from the synced threads for the current user, indicating which threads the current user has been added to
    public var members: [ThreadMember]
    
}
