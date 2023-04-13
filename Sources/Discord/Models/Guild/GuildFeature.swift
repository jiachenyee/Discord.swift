//
//  File.swift
//  
//
//  Created by Jia Chen Yee on 24/3/23.
//

import Foundation

public enum GuildFeature: String, Codable {
    /// guild has access to set an animated guild banner image
    case animatedBanner = "ANIMATED_BANNER"
    
    /// guild has access to set an animated guild icon
    case animatedIcon = "ANIMATED_ICON"
    
    /// guild is using the old permissions configuration behavior
    case applicationCommandPermissionV2 = "APPLICATION_COMMAND_PERMISSIONS_V2"
    
    /// guild has set up auto moderation rules
    case autoModeration = "AUTO_MODERATION"
    
    /// guild has access to set a guild banner image
    case banner = "BANNER"
    
    /// guild can enable welcome screen, Membership Screening, stage channels and discovery, and receives community updates
    case community = "COMMUNITY"
    
    /// guild has enabled monetization
    case creatorMonetizableProvisional = "CREATOR_MONETIZABLE_PROVISIONAL"
    
    /// guild has enabled the role subscription promo page
    case creatorStorePage = "CREATOR_STORE_PAGE"
    
    /// guild has been set as a support server on the App Directory
    case developerSupportServer = "DEVELOPER_SUPPORT_SERVER"
    
    /// guild is able to be discovered in the directory
    case discoverable = "DISCOVERABLE"
    
    /// guild is able to be featured in the directory
    case featurable = "FEATURABLE"
    
    /// guild has paused invites, preventing new users from joining
    case invitesDisabled = "INVITES_DISABLED"
    
    /// guild has access to set an invite splash background
    case inviteSplash = "INVITE_SPLASH"
    
    /// guild has enabled Membership Screening
    case memberVerificationGateEnabled = "MEMBER_VERIFICATION_GATE_ENABLED"
    
    /// guild has increased custom sticker slots
    case moreStickers = "MORE_STICKERS"
    
    /// guild has access to create announcement channels
    case news = "NEWS"
    
    /// guild is partnered
    case partnered = "PARTNERED"
    
    /// guild can be previewed before joining via Membership Screening or the directory
    case previewEnabled = "PREVIEW_ENABLED"
    
    /// guild is able to set role icons
    case roleIcons = "ROLE_ICONS"
    
    /// guild has role subscriptions that can be purchased
    case roleSubscriptionsAvailableForPurchase = "ROLE_SUBSCRIPTIONS_AVAILABLE_FOR_PURCHASE"
    
    /// guild has enabled role subscriptions
    case roleSubscriptionsEnabled = "ROLE_SUBSCRIPTIONS_ENABLED"
    
    /// guild has enabled ticketed events
    case ticketedEventsEnabled = "TICKETED_EVENTS_ENABLED"
    
    /// guild has access to set a vanity URL
    case vanityURL = "VANITY_URL"
    
    /// guild is verified
    case verified = "VERIFIED"
    
    /// guild has access to set 384kbps bitrate in voice (previously VIP voice servers)
    case vipRegions = "VIP_REGIONS"
    
    /// guild has enabled the welcome screen
    case welcomeScreenEnabled = "WELCOME_SCREEN_ENABLED"
    
    case onboardingHasPrompts = "GUILD_ONBOARDING_HAS_PROMPTS"
    case onboardingEverEnabled = "GUILD_ONBOARDING_EVER_ENABLED"
    case guildOnboarding = "GUILD_ONBOARDING"
    case threeDayThreadArchive = "THREE_DAY_THREAD_ARCHIVE"
    case serverGuide = "GUILD_SERVER_GUIDE"
}
