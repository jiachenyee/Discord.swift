//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public struct IntegrationApplication: Codable {
    /// the id of the app
    public var id: Snowflake
    
    /// the name of the app
    public var name: String
    
    /// the icon hash of the app
    public var icon: String?
    
    /// the description of the app
    public var description: String
    
    /// the bot associated with this application
    public var bot: User?
}
