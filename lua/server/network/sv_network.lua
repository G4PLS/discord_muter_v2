include("shared/globals/sh_globals.lua")
include("server/util/sv_id_mapping.lua")
include("shared/logging/sh_logger.lua")

function isSuperAdmin(ply)
    logDebug("Checking if Player is SuperAdmin")
    if not ply:IsSuperAdmin() then
        logWarning("Missing permissions for player " .. ply:Nick() .. " to execute that command")
        return false
    end
    return true
end

-- Receiving from Client
net.Receive(network.server.ADD_USER_DISCORD_ID, function(len, ply)
    logDebug("Trying to add users discord ID to Mapping")

    local discord_id = net.ReadString()
    addConnectionID(ply, discord_id)
end)

net.Receive(network.server.REMOVE_USER_DISCORD_ID,function(len, ply)
    logDebug("Trying to remove user from discord ID mapping")

    if isSuperAdmin(ply) then
        logDebug("Removing player " .. ply:Nick() " from mapping")
        removeConnectionID(ply)
    end
end)

net.Receive(network.server.CLEAR_USER_DISCORD_ID, function(len, ply)
    logDebug("Trying to clear discord id mappings")
    if isSuperAdmin(ply) then
        clearConnectionIDs()
    end
end)

net.Receive(network.server.BOT_ENDPOINT, function(len, ply)
    logDebug("Trying to set Bot endpoint")
    if isSuperAdmin(ply) then
        local endpoint = net.ReadString()
        RunConsoleCommand(con_vars.BOT_ENDPOINT, endpoint)
        logInfo("Bot Endpoint set to: " .. endpoint)
    end
end)

net.Receive(network.server.BOT_API_KEY, function(len, ply)
    logDebug("Trying to set Bot api key")

    if isSuperAdmin(ply) then
        local api_key = net.ReadString()
        RunConsoleCommand(con_vars.BOT_API_KEY, api_key)
        logInfo("Bot api key set to: " .. api_key)
    end
end)