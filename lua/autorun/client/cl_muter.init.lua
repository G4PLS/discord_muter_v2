local globals = include("globals.lua")
-- Setup Client commands

concommand.Add(globals.con_vars.DEBUG,
function(ply, cmd, args, argStr)
    net.Start(globals.network.server.DEBUG)
    net.WriteBool(args[1])
    net.SendToServer()
end,
function(cmd, argStr, args)
    return {
        globals.con_vars.DEBUG .. ' ' .. '0',
        globals.con_vars.DEBUG .. ' ' .. '1'
    }
end)