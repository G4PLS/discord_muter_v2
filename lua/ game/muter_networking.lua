local globals = include("globals.lua")

net.Receive(globals.network.server.DEBUG, function(len, ply)
    print(ply:Nick())
    local setting_debug = net.ReadBool()
    print(tostring(setting_debug))
end)