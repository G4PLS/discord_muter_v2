-- local logger = include("utils/logger.lua")

include("shared/globals/sh_globals.lua")
include("server/globals/sv_globals.lua")
include("server/util/sv_id_mapping.lua")
include("shared/logging/sh_logger.lua")

concommand.Add(commands.LIST_DISCORD_MAPPING, function(ply, cmd, args, argStr)
    logTable(_G.id_mapping, "Connection Mappings")
end)

concommand.Add(commands.LIST_CON_VARS, function(ply, cmd, args, argStr)
    for key, value in pairs(con_vars) do
        logDebug(value .. ":" .. GetConVar(value):GetString())
    end
end)