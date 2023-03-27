//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

extension GatewayManager {
    func handleDispatch(jsonObject: [String: Any]) {
        guard let event = GatewayEvent(jsonObject: jsonObject) else {
            print("Unrecognised Event:", jsonObject["t"] ?? "")
            return
        }
        
        bot.eventHandler?(event)
    }
}
