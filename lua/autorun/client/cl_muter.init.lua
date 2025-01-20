local globals = include("globals.lua")
-- Setup Client commands

concommand.Add(globals.con_vars.DEBUG,
function(ply, cmd, args, argStr)
    net.Start(globals.network.server.DEBUG)
    net.WriteBool(args[0])
    net.SendToServer()
end,
function(cmd, argStr, args)
    return {
        cmd .. " 1",
        cmd .. " 0"
    }
end)