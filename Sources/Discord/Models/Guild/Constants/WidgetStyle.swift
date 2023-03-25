//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 25/3/23.
//

import Foundation

public enum WidgetStyle: String, Codable {
    /// shield style widget with Discord icon and guild members online count
    case shield = "shield"
    
    /// large image with guild icon, name and online count. "POWERED BY DISCORD" as the footer of the widget
    case banner1 = "banner1"
    
    /// smaller widget style with guild icon, name and online count. Split on the right with Discord logo
    case banner2 = "banner2"
    
    /// large image with guild icon, name and online count. In the footer, Discord logo on the left and "Chat Now" on the right
    case banner3 = "banner3"
    
    /// large Discord logo at the top of the widget. Guild icon, name and online count in the middle portion of the widget and a "JOIN MY SERVER" button at the bottom
    case banner4 = "banner4"
}
