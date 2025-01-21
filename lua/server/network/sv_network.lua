include("shared/globals/sh_globals.lua")
include("server/util/sv_id_mapping.lua")
include("shared/logging/sh_logger.lua")

function isSuperAdmin(ply)
    logDebug("Checking if Player is SuperAdmin")
    if not ply:IsSuperAdmin() then
        logWarning("Missing permissions for player " .. ply:Nick() .. " to execute that command")
        return false
    end
    return true
end

-- Receiving from Client
net.Receive(network.server.SET_DEBUG, function(len, ply)
    logInfo("Trying to set " .. con_vars.DEBUG)

    if isSuperAdmin(ply) then
        local debug_enabled = net.ReadBit()
        RunConsoleCommand(con_vars.DEBUG, debug_enabled)
    end
end)

net.Receive(network.server.SET_LOG_TIME, function(len, ply)
    logInfo("Trying to set " .. con_vars.LOG_TIME)

    if isSuperAdmin(ply) then
        local time_logging_enabled = net.ReadBit()
        RunConsoleCommand(con_vars.LOG_TIME, time_logging_enabled)
    end
end)

net.Receive(network.server.SET_LOG_LEVELS, function(len, ply)
    logInfo("Trying to set " .. con_vars.LOG_LEVELS)

    if isSuperAdmin(ply) then
        local log_levels = net.ReadString()
        RunConsoleCommand(con_vars.LOG_LEVELS, log_levels)
    end
end)

net.Receive(network.server.SET_BOT_ENDPOINT, function(len, ply)
    logInfo("Trying to set " .. con_vars.BOT_ENDPOINT)

    if isSuperAdmin(ply) then
        local bot_endpoint = net.ReadString()
        RunConsoleCommand(con_vars.BOT_ENDPOINT, bot_endpoint)
    end
end)

net.Receive(network.server.SET_BOT_API_KEY, function(len, ply)
    logInfo("Trying to set " .. con_vars.BOT_API_KEY)

    if isSuperAdmin(ply) then
        local bot_api_key = net.ReadString()
        RunConsoleCommand(con_vars.BOT_API_KEY, bot_api_key)
    end
end)

net.Receive(network.server.SET_SERVER_LINK, function(len, ply)
    logInfo("Trying to set " .. con_vars.SERVER_LINK)

    if isSuperAdmin(ply) then
        local server_link = net.ReadString()
        RunConsoleCommand(con_vars.SERVER_LINK, server_link)
    end
end)

net.Receive(network.server.SET_MUTER_ENABLED, function(len, ply)
    logInfo("Trying to set " .. con_vars.ENABLE_MUTER)

    if isSuperAdmin(ply) then
        local muter_enabled = net.ReadBit()
        RunConsoleCommand(con_vars.ENABLE_MUTER, muter_enabled)
    end
end)

net.Receive(network.server.SET_MUTE_DURATION, function(len, ply)
    logInfo("Trying to set " .. con_vars.MUTE_DURATION)

    if isSuperAdmin(ply) then
        local mute_duration = net.ReadUInt(16)
        RunConsoleCommand(con_vars.MUTE_DURATION, mute_duration)
    end
end)

net.Receive(network.server.SET_AUTO_CONNECT, function(len, ply)
    logInfo("Trying to set " .. con_vars.AUTO_CONNECT)

    if isSuperAdmin(ply) then
        local auto_connect = net.ReadBit()
        RunConsoleCommand(con_vars.AUTO_CONNECT, auto_connect)
    end
end)