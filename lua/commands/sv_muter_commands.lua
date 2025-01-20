local logger = include("utils/logger.lua")
include("discord_integration/sv_id_mapper.lua")
include("muter_globals/sh_globals.lua")

concommand.Add("muter_list_ids", function(ply, cmd, args, argStr)
    logger.logTable(_G.id_mapping, "Connection Mapping", "Listing connection mappings")
end)

concommand.Add("muter_list_vars", function(ply, cmd, args, argStr)
    for key, value in pairs(con_vars) do
        logger.logDebug(tostring(value) .. ":" .. GetConVar(value):GetString())
    end
end)