include("muter_globals/sh_globals.lua")

-- 460863943628554260
concommand.Add("muter_add_id", function(ply, cmd, args, argStr)
    local user_id = args[1]

    net.Start(network.server.ADD_USER_DISCORD_ID)
    net.WriteString(user_id)
    net.SendToServer()
end)

concommand.Add("muter_remove_id", function(ply, cmd, args, argStr)
    net.Start(network.server.REMOVE_USER_DISCORD_ID)
    net.SendToServer()
end)

concommand.Add("muter_clear_ids", function(ply, cmd, args, argStr)
    net.Start(network.server.CLEAR_USER_DISCORD_ID)
    net.SendToServer()
end)