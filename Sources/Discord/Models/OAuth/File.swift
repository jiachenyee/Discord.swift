//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 28/3/23.
//

import Foundation

public enum OAuth2Scope: String, Codable {
    /// allows your app to fetch data from a user's "Now Playing/Recently Played" list - requires Discord approval
    case activitiesRead = "activities.read"
    
    /// allows your app to update a user's activity - requires Discord approval (NOT REQUIRED FOR GAMESDK ACTIVITY MANAGER)
    case activitiesWrite = "activities.write"
    
    /// allows your app to read build data for a user's applications
    case applicationsBuildsRead = "applications.builds.read"
    
    /// allows your app to upload/update builds for a user's applications - requires Discord approval
    case applicationsBuildsUpload = "applications.builds.upload"
    
    /// allows your app to use commands in a guild
    case applicationsCommands = "applications.commands"
    
    /// allows your app to update its commands using a Bearer token - client credentials grant only
    case applicationsCommandsUpdate = "applications.commands.update"
    
    /// allows your app to update permissions for its commands in a guild a user has permissions to
    case applicationsCommandsPermissionsUpdate = "applications.commands.permissions.update"
    
    /// allows your app to read entitlements for a user's applications
    case applicationsEntitlements = "applications.entitlements"
    
    /// allows your app to read and update store data (SKUs, store listings, achievements, etc.) for a user's applications
    case applicationsStoreUpdate = "applications.store.update"
    
    /// for oauth2 bots, this puts the bot in the user's selected guild by default
    case bot = "bot"
    
    /// allows /users/@me/connections to return linked third-party accounts
    case connections = "connections"
    
    /// allows your app to see information about the user's DMs and group DMs - requires Discord approval
    case dmChannelsRead = "dm_channels.read"
    
    /// enables /users/@me to return an email
    case email = "email"
    
    /// allows your app to join users to a group dm
    case gdmJoin = "gdm.join"
    
    /// allows /users/@me/guilds to return basic information about all of a user's guilds
    case guilds = "guilds"
    
    /// allows /guilds/{guild.id}/members/{user.id} to be used for joining users to a guild
    case guildsJoin = "guilds.join"
    
    /// allows /users/@me/guilds/{guild.id}/member to return a user's member information in a guild
    case guildsMembersRead = "guilds.members.read"
    
    /// allows /users/@me without email
    case identify = "identify"
    
    /// for local rpc server api access, this allows you to read messages from all client channels (otherwise restricted to channels/guilds your app creates)
    case messagesRead = "messages.read"
    
    /// allows your app to know a user's friends and implicit relationships - requires Discord approval
    case relationshipsTead = "relationships.read"
    
    /// allows your app to update a user's connection and metadata for the app
    case roleConnectionsWrite = "role_connections.write"
    
    /// for local rpc server access, this allows you to control a user's local Discord client - requires Discord approval
    case rpc = "rpc"
    
    /// for local rpc server access, this allows you to update a user's activity - requires Discord approval
    case rpcActivitiesWrite = "rpc.activities.write"
    
    /// for local rpc server access, this allows you to receive notifications pushed out to the user - requires Discord approval
    case rpcNotificationsRead = "rpc.notifications.read"
    
    /// for local rpc server access, this allows you to read a user's voice settings and listen for voice events - requires Discord approval
    case rpcVoiceRead = "rpc.voice.read"
    
    /// for local rpc server access, this allows you to update a user's voice settings - requires Discord approval
    case rpcVoiceWrite = "rpc.voice.write"
    
    /// allows your app to connect to voice on user's behalf and see all the voice members - requires Discord approval
    case voice = "voice"
    
    /// this generates a webhook that is returned in the oauth token response for authorization code grants
    case webhookIncoming = "webhook.incoming"
}
