//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 26/3/23.
//

import Foundation

public extension Bot {
    func listScheduledEvents(forGuild guildId: Snowflake,
                             withUserCount: Bool = true) async throws -> [ScheduledEvent] {
        try await sendRequest([ScheduledEvent].self,
                              endpoint: "guilds/\(guildId)/scheduled-events",
                              parameters: ["with_user_count": withUserCount])
    }
}
