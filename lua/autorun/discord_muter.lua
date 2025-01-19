globals = include("terrortown/autorun/globals.lua")

print("DISCORD PRE NETWORK")

util.AddNetworkString(globals.network_strings.DRAW_MUTE)
util.AddNetworkString(globals.network_strings.CONNECT_DISCORD_ID)
util.AddNetworkString(globals.network_strings.PLAYER_TABLE)
util.AddNetworkString(globals.network_strings.REQUEST_PLAYER_TABLE)
util.AddNetworkString(globals.network_strings.TEST_CONNECTION)
util.AddNetworkString(globals.network_strings.REQUEST_TEST_CONNECTION)
util.AddNetworkString(globals.network_strings.ADDON_VERSION)
util.AddNetworkString(globals.network_strings.REQUEST_ADDON_VERSION)
util.AddNetworkString(globals.network_strings.BOT_VERSION)
util.AddNetworkString(globals.network_strings.REQUEST_BOT_VERSION)

print("DISCORD PRE CONVAR")

CreateConVar(globals.con_vars.DEBUG, 0, 1, "Print debug messages to the Console")
CreateConVar(globals.con_vars.ENDPOINT, "http://localhost:37405", 1, "Sets the node bot endpoint.")
CreateConVar(globals.con_vars.API_KEY, "", 1, "Sets the node bot api-key.")
CreateConVar(globals.con_vars.DISCORD_NAME, "Discord", 1, "Sets the Plugin Prefix for helpermessages.") --The name which will be displayed in front of any Message
CreateConVar(globals.con_vars.SERVER_LINK, "https://discord.gg/", 1, "Sets the Discord server your bot is present on (eg: https://discord.gg/aBc123).")
CreateConVar(globals.con_vars.MUTE_ROUND, 1, 1, "Mute the player until the end of the round.", 0, 1)
CreateConVar(globals.con_vars.MUTE_DURATION, 5, 1, "Sets how long, in seconds, you are muted for after death. No effect if mute_round is on. ", 1, 60)
CreateConVar(globals.con_vars.AUTO_CONNECT, 0, 1, "Attempt to automatically match player name to discord name. This happens silently when the player connects. If it fails, it will prompt the user with the \"!discord NAME\" message.", 0, 1)

print("DISCORD PRE INCLUDE")

include("terrortown/utils/logging.lua")
include("terrortown/hooks/discord_hooks.lua")

print("DISCORD PRE LOG SERVER")

log_debug("AUTORUN SERVER V1")