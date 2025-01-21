include("shared/globals/sh_globals.lua")
include("server/util/sv_id_mapping.lua")
include("shared/logging/sh_logger.lua")

function isSuperAdmin(ply)
    if not ply:IsSuperAdmin() then
        logWarning("Missing permissions for player " .. ply:Nick() .. " to execute that command")
        return false
    end
    return true
end

-- Receiving from Client
net.Receive(network.server.SET_DEBUG, function(len, ply)
    if isSuperAdmin(ply) then
        local debug_enabled = net.ReadBit()
        RunConsoleCommand(con_vars.DEBUG, tostring(debug_enabled))
        logDebug("Set " .. con_vars.DEBUG .. " to " .. tostring(debug_enabled))
    end
end)

net.Receive(network.server.SET_LOG_TIME, function(len, ply)
    if isSuperAdmin(ply) then
        local time_logging_enabled = net.ReadBit()
        RunConsoleCommand(con_vars.LOG_TIME, tostring(time_logging_enabled))
        logDebug("Set " .. con_vars.LOG_TIME .. " to " .. tostring(time_logging_enabled))
    end
end)

net.Receive(network.server.SET_LOG_LEVELS, function(len, ply)
    if isSuperAdmin(ply) then
        local log_levels = net.ReadString()
        RunConsoleCommand(con_vars.LOG_LEVELS, log_levels)
        logDebug("Set " .. con_vars.LOG_LEVELS .. " to " .. tostring(log_levels))
    end
end)

net.Receive(network.server.SET_BOT_ENDPOINT, function(len, ply)
    if isSuperAdmin(ply) then
        local bot_endpoint = net.ReadString()
        RunConsoleCommand(con_vars.BOT_ENDPOINT, bot_endpoint)
        logDebug("Set " .. con_vars.BOT_ENDPOINT .. " to " .. tostring(bot_endpoint))
    end
end)

net.Receive(network.server.SET_BOT_API_KEY, function(len, ply)
    if isSuperAdmin(ply) then
        local bot_api_key = net.ReadString()
        RunConsoleCommand(con_vars.BOT_API_KEY, bot_api_key)
        logDebug("Set " .. con_vars.BOT_API_KEY .. " to " .. tostring(bot_api_key))
    end
end)

net.Receive(network.server.SET_SERVER_LINK, function(len, ply)
    if isSuperAdmin(ply) then
        local server_link = net.ReadString()
        RunConsoleCommand(con_vars.SERVER_LINK, server_link)
        logDebug("Set " .. con_vars.SERVER_LINK .. " to " .. tostring(server_link))
    end
end)

net.Receive(network.server.SET_MUTER_ENABLED, function(len, ply)
    if isSuperAdmin(ply) then
        local muter_enabled = net.ReadBit()
        RunConsoleCommand(con_vars.ENABLE_MUTER, tostring(muter_enabled))
        logDebug("Set " .. con_vars.ENABLE_MUTER .. " to " .. tostring(muter_enabled))
    end
end)

net.Receive(network.server.SET_MUTE_DURATION, function(len, ply)
    if isSuperAdmin(ply) then
        local mute_duration = net.ReadUInt(16)
        RunConsoleCommand(con_vars.MUTE_DURATION, mute_duration)
        logDebug("Set " .. con_vars.MUTE_DURATION .. " to " .. tostring(mute_duration))
    end
end)

net.Receive(network.server.SET_AUTO_CONNECT, function(len, ply)
    if isSuperAdmin(ply) then
        local auto_connect = net.ReadBit()
        RunConsoleCommand(con_vars.AUTO_CONNECT, tostring(auto_connect))
        logDebug("Set " .. con_vars.AUTO_CONNECT .. " to " .. tostring(auto_connect))
    end
end)