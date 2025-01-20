include("utils/id_helper.lua")
local logger = include("utils/logger.lua")

local ID_MAPPING_CACHE_PATH = "discord_connection_cache"

function backupConnectionIDs(connections)
    local timestamp = os.time()
    local time_string = os.date("%Y-%m-%d", timestamp)
    local backup_file_name = ID_MAPPING_CACHE_PATH .. "_BACKUP_" .. time_string

    file.Write(backup_file_name .. ".json", util.TableToJSON(connections, true))
    logger.logInfo("Discord ConnectionIDs backed up to:" .. backup_file_name)
end

function loadConnectionIDs()
    local id_mapping_cache = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")

    if not id_mapping_cache then
        logger.logError("Wasnt able to load Connection Cache")
        return
    end

    local json_id_mapping_cache = util.JSONToTable(id_mapping_cache)

    logger.logInfo("Attempting to collect from ConnectionID cache")
    logger.logTable(json_id_mapping_cache, "Connection Cache", "Printing Connection Cache")

    _G.id_mapping = json_id_mapping_cache
    logger.logInfo("ConnectionID cache collected")
    logger.logTable(_G.id_mapping, "Connection Mapping", "Printing final Connection Mappings")
end

function writeConnectionIDs()
    local json_table = util.TableToJSON(_G.id_mapping, true)
    file.Write(ID_MAPPING_CACHE_PATH .. ".json", json_table)

    local written_connections = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")
    logger.logInfo(tostring(util.TableToJSON(_G.id_mapping, true)))
    logger.logInfo(written_connections)

    if written_connections == util.TableToJSON(_G.id_mapping, true) then
        logger.logInfo("Cache written!")
    else
        logger.logError("Cache write failed!")
    end
end

function clearConnectionIDs()
    logger.logInfo("Clearing Connection IDs")

    _G.id_mapping = {}
    writeConnectionIDs()

    logger.logTable(_G.id_mapping, "ConnectionIDs", "Cleared Connections from Table")
end

function addConnectionID(ply, discordID)
    logger.logInfo("Adding " .. ply:Nick() .. " to ids, with id: " .. discordID)

    _G.id_mapping[playerIdToString(ply)] = discordID
    writeConnectionIDs()

    logger.logTable(_G.id_mapping, "ConnectionIDs", "Added Player to Table")
end

function removeConnectionID(ply)
    _G.id_mapping[playerIdToString(ply)] = nil
    writeConnectionIDs()

    logger.logTable(_G.id_mapping, "ConnectionIDs", "Removed Player from Table")
end

function containsConnectionID(ply)
    return _G.id_mapping[playerIdToString(ply)] ~= nil
end

function getIdMappingByPlayer(ply)
    return _G.id_mapping[playerIdToString(ply)]
end