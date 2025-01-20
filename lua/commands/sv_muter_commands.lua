local logger = include("utils/logger.lua")
include("discord_integration/sv_id_mapper.lua")

concommand.Add("muter_list_ids", function(ply, cmd, args, argStr)
    logger.logTable(_G.id_mapping, "Connection Mapping", "Listing connection mappings")
end)

concommand.Add("muter_print_cache_file", function(ply, cmd, args, argStr)
    logger.logDebug("Printing cache file")
    local id_mapping_cache = file.Read("discord_connection_cache" .. ".json", "DATA")
    logger.logDebug(id_mapping_cache)
    local json_id_mapping_cache = util.JSONToTable(id_mapping_cache, false, true)
    logger.logTable(json_id_mapping_cache, "JSON Cache", "Printing Json Cache")
end)