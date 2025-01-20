local globals = include("globals.lua")
-- Setup Client commands

concommand.Add(globals.con_vars.DEBUG, 
function(ply, cmd, args, argStr)
    print(ply:Nick())
    print(cmd)
    print(args)
    print(argsStr)
    --net.Start(globals.network.server.DEBUG)
end,
function(cmd, argStr, args) 
    return {
        cmd .. "1",
        cmd .. "0"
    }
end,
"Helping text for this")