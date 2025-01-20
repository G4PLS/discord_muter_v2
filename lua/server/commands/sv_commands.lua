-- local logger = include("utils/logger.lua")

include("shared/globals/sh_globals.lua")
include("server/util/sv_id_mapping.lua")
include("shared/logging/sh_logger.lua")

concommand.Add("muter_list_ids", function(ply, cmd, args, argStr)
    logTable(_G.id_mapping, "Connection Mappings")
end)

concommand.Add("muter_list_vars", function(ply, cmd, args, argStr)
    for key, value in pairs(con_vars) do
        logDebug(value .. ":" .. GetConVar(value):GetString())
    end
end)