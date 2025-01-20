local logger = include("utils/logger.lua")

local CONNECTION_CACHE_PATH = "discord_connection_cache"
local connections = {}

function backupConnectionIDs(connections)
    local timestamp = os.time()
    local time_string = os.date("%Y-%m-%d", timestamp)
    local backup_file_name = CONNECTION_CACHE_PATH .. "_BACKUP_" .. time_string

    file.Write(backup_file_name .. ".json", util.TableToJSON(connections, true))
    logger.logInfo("Discord ConnectionIDs backed up to:" .. backup_file_name)
end

function getConnectionIDs()
    local connection_cache = file.Read(CONNECTION_CACHE_PATH .. ".json", "DATA")
    logger.logInfo("Attempting to collect from ConnectionID cache")

    if connection_cache then
        connections = util.JSONToTable(connection_cache)
        logger.logInfo("ConnectionID cache collected")
    else
        logger.logError("ConnectionID cache failure")
    end
    return connections
end

function writeConnectionIDs(connections)
    file.Write(CONNECTION_CACHE_PATH .. ".json", util.TableToJSON(connections, true))

    local written_connections = file.Read(CONNECTION_CACHE_PATH .. ".json", "DATA")
    if written_connections == util.TableToJSON(connections, true) then
        logger.logInfo("Cache written!")
    else
        logger.logError("Cache write failed!")
    end
end

function addConnectionID(ply, discordID)
    logger.logInfo("ADDING ID")
    logger.logInfo(ply:Nick())
    print(discordID)

    if discordID == nil then
        return
    end

    --logger.logInfo("Adding " .. ply:Nick() .. " to ids, with id: " .. discordID)
    connections[ply:SteamID64()] = discordID
    writeConnectionIDs(connections)

    PrintTable(connections)
end

function removeConnectionID(ply)
    connections[ply:SteamID64()] = nil
    writeConnectionIDs(connections)
end