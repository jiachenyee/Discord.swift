//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 27/3/23.
//

import Foundation

public struct PartialApplication: Codable {
    /// the id of the app
    public var id: Snowflake
    
    /// the name of the app
    public var name: String?
    
    /// the icon hash of the app
    public var icon: String?
    
    /// the description of the app
    public var description: String?
    
    /// an array of rpc origin urls, if rpc is enabled
    public var rpcOrigins: [String]?
    
    /// when false only app owner can join the app's bot to guilds
    public var botPublic: Bool?
    
    /// when true the app's bot will only join upon completion of the full oauth2 code grant flow
    public var botRequireCodeGrant: Bool?
    
    /// the url of the app's terms of service
    public var termsOfServiceURL: String?
    
    /// the url of the app's privacy policy
    public var privacyPolicyURL: String?
    
    // partial user object containing info on the owner of the application
    public var owner: User?
    
    /// the hex encoded key for verification in interactions and the GameSDK's GetTicket
    public var verifyKey: String?
    
    /// if the application belongs to a team, this will be a list of the members of that team
    public var team: Team?
    
    /// if this application is a game sold on Discord, this field will be the guild to which it has been linked
    public var guildId: Snowflake?
    
    /// if this application is a game sold on Discord, this field will be the id of the "Game SKU" that is created, if exists
    public var primarySKUId: Snowflake?
    
    /// if this application is a game sold on Discord, this field will be the URL slug that links to the store page
    public var slug: String?
    
    /// the application's default rich presence invite cover image hash
    public var coverImage: String?
    
    /// the application's public flags
    public var flags: ApplicationFlags?
    
    /// up to 5 tags describing the content and functionality of the application
    public var tags: [String]?
    
    /// settings for the application's default in-app authorization link, if enabled
    public var installParams: InstallParams?
    
    /// the application's default custom authorization link, if enabled
    public var customInstallURL: String?
    
    /// the application's role connection verification entry point, which when configured will render the app as a verification method in the guild role verification configuration
    public var roleConnectionsVerificationURL: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case icon = "icon"
        case description = "description"
        case rpcOrigins = "rpc_origins"
        case botPublic = "bot_public"
        case botRequireCodeGrant = "bot_require_code_grant"
        case termsOfServiceURL = "terms_of_service_url"
        case privacyPolicyURL = "privacy_policy_url"
        case owner = "owner"
        case verifyKey = "verify_key"
        case team = "team"
        case guildId = "guild_id"
        case primarySKUId = "primary_sku_id"
        case slug = "slug"
        case coverImage = "cover_image"
        case flags = "flags"
        case tags = "tags"
        case installParams = "install_params"
        case customInstallURL = "custom_install_url"
        case roleConnectionsVerificationURL = "role_connections_verification_url"
    }
}
