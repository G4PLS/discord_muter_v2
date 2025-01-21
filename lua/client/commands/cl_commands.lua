include("shared/globals/sh_globals.lua")
include("client/globals/cl_globals.lua")

concommand.Add(commands.SET_DEBUG_ENABLED, function(ply, cmd, args, argStr)
    local debug_enabled = args[1] == "1"

    net.Start(network.server.SET_DEBUG)
    net.WriteBit(debug_enabled)
    net.SendToServer()
end, function(cmd, args)
    return {
        commands.SET_DEBUG_ENABLED .. ' ' .. '0',
        commands.SET_DEBUG_ENABLED .. ' ' .. '1'
    }
end)

concommand.Add(commands.SET_DEBUG_LOG_TIME_ENABLED, function(ply, cmd, args, argStr)
    local debug_time_enabled = args[1] == "1"

    net.Start(network.server.SET_LOG_TIME)
    net.WriteBit(debug_time_enabled)
    net.SendToServer()
end, function(cmd, args)
    return {
        commands.SET_DEBUG_LOG_TIME_ENABLED .. ' ' .. '0',
        commands.SET_DEBUG_LOG_TIME_ENABLED .. ' ' .. '1'
    }
end)

concommand.Add(commands.SET_DEBUG_LOG_LEVELS, function(ply, cmd, args, argStr)
    local log_levels = ""

    for i=1, #args do
        log_levels = args[i] .. "|"
    end

    net.Start(network.server.SET_LOG_LEVELS)
    net.WriteString(log_levels)
    net.SendToServer()
end, function(cmd, args)
    local auto_completed = {}

    for i=1, #LOG_LEVELS do
        table.insert(auto_completed, commands.SET_DEBUG_LOG_LEVELS .. ' ' .. LOG_LEVELS[i])
    end

    return auto_completed
end)

concommand.Add(commands.SET_BOT_ENDPOINT, function(ply, cmd, args, argStr)
    net.Start(network.server.SET_BOT_ENDPOINT)
    net.WriteString(args[1])
    net.SendToServer()
end)

concommand.Add(commands.SET_BOT_API_KEY, function(ply, cmd, args, argStr)
    net.Start(network.server.SET_BOT_API_KEY)
    net.WriteString(args[1])
    net.SendToServer()
end)

concommand.Add(commands.SET_SERVER_LINK, function(ply, cmd, args, argStr)
    net.Start(network.server.SET_SERVER_LINK)
    net.WriteString(args[1])
    net.SendToServer()
end)

concommand.Add(commands.SET_MUTER_ENABLED, function(ply, cmd, args, argStr)
    local muter_enabled = args[1] == "1"

    net.Start(network.server.SET_MUTER_ENABLED)
    net.WriteBit(muter_enabled)
    net.SendToServer()
end, function(cmd, args)
    return {
        commands.SET_MUTER_ENABLED .. ' ' .. '0',
        commands.SET_MUTER_ENABLED .. ' ' .. '1'
    }
end)

concommand.Add(commands.SET_MUTE_DURATION, function(ply, cmd, args, argStr)
    local mute_duration = tonumber(args[1])

    print("MUTE DURAITON")
    print(mute_duration)
    if mute_duration == nil then
        return
    end

    net.Start(network.server.SET_MUTE_DURATION)
    net.WriteInt(mute_duration)
    net.SendToServer()
end)

concommand.Add(commands.SET_AUTO_CONNECT_ENABLED, function(ply, cmd, args, argStr)
    local auto_connect_enabled = args[1] == "1"

    net.Start(network.server.SET_AUTO_CONNECT)
    net.WriteBit(auto_connect_enabled)
    net.SendToServer()
end, function(cmd, args)
    return {
        commands.SET_AUTO_CONNECT_ENABLED .. ' ' .. '0',
        commands.SET_AUTO_CONNECT_ENABLED .. ' ' .. '1'
    }
end)


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