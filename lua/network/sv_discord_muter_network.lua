include("muter_globals/sh_globals.lua")
include("muter_globals/sv_globals.lua")
include("discord_integration/sv_discord_id_caching.lua")

local logger = include("utils/logger.lua")

function isSuperAdmin(cmd, ply)
    if not ply.IsSuperAdmin() then
        logger.logWarning(tostring(ply:Nick()) .. " tried to send: " .. tostring(cmd))
        return false
    end
    return true
end

-- Receiving from Client
net.Receive(network.server.ADD_USER_DISCORD_ID, function(len, ply)
    local discord_id = net.ReadString()
    print(ply:Nick())
    print(discord_id)

    addConnectionID(ply, discord_id)
end)