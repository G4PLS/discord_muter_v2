include("hooks/discord_hooks.lua")

print("Discord Autorun Server")

util.AddNetworkString("drawMute")
util.AddNetworkString("connectDiscordID")
util.AddNetworkString("discordPlayerTable")
util.AddNetworkString("request_discordPlayerTable")
util.AddNetworkString("discordTestConnection")
util.AddNetworkString("request_discordTestConnection")
util.AddNetworkString("addonVersion")
util.AddNetworkString("request_addonVersion")
util.AddNetworkString("botVersion")
util.AddNetworkString("request_botVersion")

CreateConVar("DiscordEndpoint", "http://localhost:37405", 1, "Sets the node bot endpoint.")
CreateConVar("DiscordAPIKey", "", 1, "Sets the node bot api-key.")
CreateConVar("DiscordName", "Discord", 1, "Sets the Plugin Prefix for helpermessages.") --The name which will be displayed in front of any Message
CreateConVar("DiscordServerLink", "https://discord.gg/", 1, "Sets the Discord server your bot is present on (eg: https://discord.gg/aBc123).")
CreateConVar("DiscordMuteRound", 1, 1, "Mute the player until the end of the round.", 0, 1)
CreateConVar("DiscordMuteDuration", 5, 1, "Sets how long, in seconds, you are muted for after death. No effect if mute_round is on. ", 1, 60)
CreateConVar("DiscordAutoConnect", 0, 1, "Attempt to automatically match player name to discord name. This happens silently when the player connects. If it fails, it will prompt the user with the \"!discord NAME\" message.", 0, 1)