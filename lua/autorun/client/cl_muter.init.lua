local globals = include("globals.lua")
-- Setup Client commands

concommand.Add(globals.con_vars.DEBUG,
function(ply, cmd, args, argStr)
    local debug_state = args[1] == "1"

    net.Start(globals.network.server.DEBUG)
    net.WriteBool(debug_state)
    net.SendToServer()
end,
function(cmd, argStr, args)
    return {
        globals.con_vars.DEBUG .. ' ' .. "1",
        globals.con_vars.DEBUG .. ' ' .. "0"
    }
end)