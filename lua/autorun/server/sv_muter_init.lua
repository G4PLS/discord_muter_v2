local globals = include("shared/globals.lua")

-- Add Network Strings
for key, value in pairs(globals.network.server) do
    util.AddNetworkString(value)
end

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

-- Create Con Vars for Server

CreateConVar(globals.con_vars.DEBUG, 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Print debug messages to the Console")
CreateConVar(globals.con_vars.LOG_TIME, 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Print the time when debugging")
CreateConVar(globals.con_vars.LOG_LEVELS, "INFO|WARN|DEBUG|ERROR", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Log levels to print")
CreateConVar(globals.con_vars.ENDPOINT, "http://localhost:37405", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the node bot endpoint.")
CreateConVar(globals.con_vars.API_KEY, "", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the node bot api-key.")
CreateConVar(globals.con_vars.DISCORD_NAME, "Discord", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the Plugin Prefix for helpermessages.")
--The name which will be displayed in front of any Message
CreateConVar(globals.con_vars.SERVER_LINK, "https://discord.gg/", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the Discord server your bot is present on (eg: https://discord.gg/aBc123).")
CreateConVar(globals.con_vars.MUTE_ROUND, 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Mute the player until the end of the round.", 0, 1)
CreateConVar(globals.con_vars.MUTE_DURATION, 5, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets how long, in seconds, you are muted for after death. No effect if mute_round is on. ", 1, 60)
CreateConVar(globals.con_vars.AUTO_CONNECT, 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Attempt to automatically match player name to discord name. This happens silently when the player connects. If it fails, it will prompt the user with the \"!discord NAME\" message.", 0, 1)

include("game/muter_hooks.lua")
include("game/muter_networking.lua")

--AddCSLuaFile("globals.lua")