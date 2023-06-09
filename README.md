# Discord.swift

A Discord API wrapper completely built with Swift.

```swift
let bot = Bot(applicationId: YOUR_APPLICATION_ID,
              token: YOUR_BOT_TOKEN,
              presence: .online(activities: [
                  .playing("Discord.swift")
              ]), intents: .all) // Be careful setting intents to `.all`. Choose only the ones you need.

// Handle incoming Discord events
bot.connect { event in
    switch event {
        case .messageCreate(let message): ... // handle new message
        default: break
    }
}
```


## What's Missing?
> Feel free to use this package, however, certain functionality is still missing.

### Functions Missing
- [Create Guild Emoji](https://discord.com/developers/docs/resources/emoji#create-guild-emoji)

### Docs Missing
- ApplicationRoleConnection
- Guild
- GuildScheduledEvent
- GuildTemplate
- Interaction
- User
- Voice
- Webhook

### Others
- Sending payload data like attachments
- Support for image data
- Improved initialisers and abstractions for interactions
