local globals = include("globals.lua")
local logger = include("utils/logger.lua")

function isSuperAdmin(cmd, ply)
    if not ply.IsSuperAdmin() then
        logger.logWarning(tostring(ply:Nick()) .. " tried to send: " .. tostring(cmd))
        return false
    end
    return true
end

-- Receiving from Client
net.Receive(globals.network.server.MUTE_ROUND, function(len, ply)
    if isSuperAdmin(globals.network.server.MUTE_ROUND, ply) then
        local mute_round = net.ReadBit()
        RunConsoleCommand(globals.con_vars.MUTE_ROUND, tostring(mute_round))
    end
end)