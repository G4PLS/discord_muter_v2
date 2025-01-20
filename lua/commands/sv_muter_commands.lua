local logger = include("utils/logger.lua")

concommand.Add("muter_list_ids", function(ply, cmd, args, argStr)
    logger.logTable(_G.id_mapping, "Connection Mapping", "Listing connection mappings")
end)