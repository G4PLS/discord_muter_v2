local globals = include("globals.lua")
-- Setup Client commands

concommand.Add(globals.con_vars.DEBUG,
function(ply, cmd, args, argStr)
    net.Start(globals.network.server.DEBUG)
    net.WriteBit(args[0])
    net.SendToServer()
end,
function(cmd, argStr, args)
    return {
        globals.con_vars.DEBUG .. ' ' .. "1",
        globals.con_vars.DEBUG .. ' ' .. "0"
    }
end)