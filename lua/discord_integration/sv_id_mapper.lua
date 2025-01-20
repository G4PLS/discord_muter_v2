local logger = include("utils/logger.lua")
include("utils/id_helper.lua")
include("network/http.lua")
include("muter_globals/sh_globals.lua")

local ID_MAPPING_CACHE_PATH = "discord_connection_cache"

function backupConnectionIDs(connections)
    local timestamp = os.time()
    local time_string = os.date("%Y-%m-%d", timestamp)
    local backup_file_name = ID_MAPPING_CACHE_PATH .. "_BACKUP_" .. time_string

    file.Write(backup_file_name .. ".json", util.TableToJSON(connections, true))
    logger.logInfo("Discord ConnectionIDs backed up to:" .. backup_file_name)
end

function loadConnectionIDs()
    logger.logInfo("Attempting to collect from ConnectionID cache")

    local id_mapping_cache = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")

    if not id_mapping_cache then
        logger.logError("Wasnt able to load Connection Cache")
        return
    end

    local json_id_mapping_cache = util.JSONToTable(id_mapping_cache, false, true)

    _G.id_mapping = json_id_mapping_cache
    logger.logInfo("ConnectionID cache collected")
end

function writeConnectionIDs()
    local json_table = util.TableToJSON(_G.id_mapping, true)
    file.Write(ID_MAPPING_CACHE_PATH .. ".json", json_table)

    local written_connections = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")

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
end

function addConnectionID(ply, discordID)
    logger.logInfo("Adding " .. ply:Nick() .. " to ids, with id: " .. discordID)
    _G.id_mapping[playerIdToString(ply)] = discordID
    writeConnectionIDs()
end

function removeConnectionID(ply)
    _G.id_mapping[playerIdToString(ply)] = nil
    writeConnectionIDs()
end

function containsConnectionID(ply)
    return _G.id_mapping[playerIdToString(ply)] ~= nil
end

function getIdMappingByPlayer(ply)
    return _G.id_mapping[playerIdToString(ply)]
end

function autoMapPlayer(ply)
    if containsConnectionID(ply) then return end

    if not GetConVar(con_vars.AUTO_CONNECT):GetBool() then
        return
    end

    logger.logDebug("Trying to auto map player steam id to discord id")

    httpFetch("connect", {
        tag = ply:Nick()
    }, function(res)
        logger.logInfo("######################")
        PrintTable(res)
        logger.logInfo(res)
        logger.logInfo(res.tag)
        logger.logInfo(res.id)
        logger.logInfo("######################")
        if res.tag and res.id then
            logger.logInfo(ply:Nick() .. " got bound to DiscordID: " .. tostring(res.id) .. " with Steam ID: " .. playerIdToString(ply))
            addConnectionID(ply, res.id)
        end
    end)
end