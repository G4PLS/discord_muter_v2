include("globals/sh_globals.lua")

-- 460863943628554260
concommand.Add("muter_add_id",
function(ply, cmd, args, argStr)
    local user_id = args[1]

    net.Start(network.server.ADD_USER_DISCORD_ID)
    net.WriteString(user_id)
    net.SendToServer()
end)