include("muter_globals/sh_globals.lua")

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

concommand.Add("muter_set_bot_endpoint", function(ply ,cmd, args, argStr)
    net.Start(network.server.BOT_ENDPOINT)
    net.WriteString(args[1])
    net.SendToServer()
end)

concommand.Add("muter_set_bot_api_key", function(ply, cmd, args, argStr)
    net.Start(network.server.BOT_API_KEY)
    net.WriteString(args[1])
    net.SendToServer()
end)