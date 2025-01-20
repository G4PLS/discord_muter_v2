include("muter_globals/sh_globals.lua")
include("muter_globals/sv_globals.lua")
include("discord_integration/sv_discord_id_caching.lua")

local logger = include("utils/logger.lua")

function isSuperAdmin(cmd, ply)
    if not ply:IsSuperAdmin() then
        logger.logWarning(tostring(ply:Nick()) .. " tried to send: " .. tostring(cmd))
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