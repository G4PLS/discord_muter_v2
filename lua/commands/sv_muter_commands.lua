local logger = include("utils/logger.lua")
include("discord_integration/sv_id_mapper.lua")

concommand.Add("muter_list_ids", function(ply, cmd, args, argStr)
    logger.logTable(_G.id_mapping, "Connection Mapping", "Listing connection mappings")
end)