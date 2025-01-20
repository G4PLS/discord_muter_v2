local globals = include("globals.lua")
local logger = include("utils/logger.lua")

-- Receiving from Client
net.Receive(globals.network.server.DEBUG, function(len, ply)
    if not ply:IsSuperAdmin() then
        logger.logWarning(tostring(ply:Nick()) .. " tried to send: " .. tostring(cmd))
    end
    local setting_debug = net.ReadBool()
    print(tostring(setting_debug))
end)