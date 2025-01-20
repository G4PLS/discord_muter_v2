include("muter_globals/sh_globals.lua")
include("discord_integration/sv_id_mapper.lua")

local logger = include("utils/logger.lua")

function isSuperAdmin(ply)
    if not ply:IsSuperAdmin() then
        logger.logWarning(tostring(ply:Nick()) .. " tried to send a command without the needed privelages")
        return false
    end
    return true
end

-- Receiving from Client
net.Receive(network.server.ADD_USER_DISCORD_ID, function(len, ply)
    local discord_id = net.ReadString()
    addConnectionID(ply, discord_id)
end)

net.Receive(network.server.REMOVE_USER_DISCORD_ID,function(len, ply)
    logger.logInfo("Received " .. network.server.REMOVE_USER_DISCORD_ID)
    if isSuperAdmin(ply) then
        logger.logInfo("Removing " .. ply:Nick())
        removeConnectionID(ply)
    end
end)

net.Receive(network.server.CLEAR_USER_DISCORD_ID, function(len, ply)
    logger.logInfo("Received " .. network.server.CLEAR_USER_DISCORD_ID)
    if isSuperAdmin(ply) then
        logger.logInfo("Clearing Connection IDs")
        clearConnectionIDs()
    end
end)

net.Receive(network.server.BOT_ENDPOINT, function(len, ply)
    logger.logInfo("Received " .. network.server.BOT_ENDPOINT)

    if isSuperAdmin(ply) then
        local endpoint = net.ReadString()
        RunConsoleCommand(con_vars.BOT_ENDPOINT, endpoint)
        logger.logInfo("BOT ENDPOINT SET TO: " .. endpoint)
    end
end)

net.Receive(network.server.BOT_API_KEY, function(len, ply)
    logger.logInfo("Received " .. network.server.BOT_API_KEY)

    if isSuperAdmin(ply) then
        local api_key = net.ReadString()
        RunConsoleCommand(con_vars.BOT_API_KEY, api_key)
        logger.logInfo("BOT API KEY SET TO: " .. api_key)
    end
end)