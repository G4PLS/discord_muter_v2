include("muter_globals/sh_globals.lua")
include("muter_globals/sv_globals.lua")

-- Add Network Strings
for key, value in pairs(network.server) do
    util.AddNetworkString(value)
end

--util.AddNetworkString(globals.network_strings.DRAW_MUTE)
--util.AddNetworkString(globals.network_strings.CONNECT_DISCORD_ID)
--util.AddNetworkString(globals.network_strings.PLAYER_TABLE)
--util.AddNetworkString(globals.network_strings.REQUEST_PLAYER_TABLE)
--util.AddNetworkString(globals.network_strings.TEST_CONNECTION)
--util.AddNetworkString(globals.network_strings.REQUEST_TEST_CONNECTION)
--util.AddNetworkString(globals.network_strings.ADDON_VERSION)
--util.AddNetworkString(globals.network_strings.REQUEST_ADDON_VERSION)
--util.AddNetworkString(globals.network_strings.BOT_VERSION)
--util.AddNetworkString(globals.network_strings.REQUEST_BOT_VERSION)

-- Create Con Vars for Server

CreateConVar(con_vars.DEBUG, 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Print debug messages to the Console")
CreateConVar(con_vars.LOG_TIME, 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Print the time when debugging")
CreateConVar(con_vars.LOG_LEVELS, "INFO|WARN|DEBUG|ERROR", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Log levels to print")

CreateConVar(con_vars.BOT_ENDPOINT, "http://localhost:37405", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the node bot endpoint.")
CreateConVar(con_vars.BOT_API_KEY, "", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the node bot api-key.")
CreateConVar(con_vars.SERVER_LINK, "https://discord.gg/", {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the Discord server your bot is present on (eg: https://discord.gg/aBc123).")

CreateConVar(con_vars.ENABLE_MUTER, 1, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets the enabled state of the muter")
CreateConVar(con_vars.MUTE_DURATION, 5, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Sets how long, in seconds, you are muted for after death. No effect if mute_round is on. ", 1, 60)
CreateConVar(con_vars.AUTO_CONNECT, 0, {FCVAR_ARCHIVE, FCVAR_NOTIFY}, "Attempt to automatically match player name to discord name. This happens silently when the player connects. If it fails, it will prompt the user with the \"!discord NAME\" message.", 0, 1)

local logger = include("utils/logger.lua")
logger.setLogLevels(GetConVar(con_vars.LOG_LEVELS):GetString(), '|')
logger.logInfo("SERVER LOADED EVERYTHING CORRECTLY")

include("hooks/sv_discord_muter_hooks.lua")
include("network/sv_discord_muter_network.lua")

AddCSLuaFile("globals/cl_globals.lua")
AddCSLuaFile("globals/sh_globals.lua")
AddCSLuaFile("commands/cl_muter_commands.lua")