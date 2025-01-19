include("terrortown/hooks/discord_hooks.lua")
include("terrortown/utils/logging.lua")

log_debug("AUTORUN SERVER V1")

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

CreateConVar("discord_muter_endpoint", "http://localhost:37405", 1, "Sets the node bot endpoint.")
CreateConVar("discord_muter_api_key", "", 1, "Sets the node bot api-key.")
CreateConVar("discord_muter_name", "Discord", 1, "Sets the Plugin Prefix for helpermessages.") --The name which will be displayed in front of any Message
CreateConVar("discord_muter_server_link", "https://discord.gg/", 1, "Sets the Discord server your bot is present on (eg: https://discord.gg/aBc123).")
CreateConVar("discord_muter_muter_round", 1, 1, "Mute the player until the end of the round.", 0, 1)
CreateConVar("discord_muter_mute_duration", 5, 1, "Sets how long, in seconds, you are muted for after death. No effect if mute_round is on. ", 1, 60)
CreateConVar("discord_muter_auto_connect", 0, 1, "Attempt to automatically match player name to discord name. This happens silently when the player connects. If it fails, it will prompt the user with the \"!discord NAME\" message.", 0, 1)