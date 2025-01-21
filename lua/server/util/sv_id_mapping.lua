-- local logger = include("utils/logger.lua")

include("shared/globals/sh_globals.lua")
include("server/discord/sv_discord_requests.lua")
include("shared/logging/sh_logger.lua")

local ID_MAPPING_CACHE_PATH = "discord_connection_cache"

function playerIdToString(ply)
    logDebug("Converting SteamID from player " .. ply:Nick() .. " to string")
    return tostring(ply:SteamID64())
end

function backupConnectionIDs(connections)
    logDebug("Trying to create backup of Connection IDs")

    local timestamp = os.time()
    local time_string = os.date("%Y-%m-%d", timestamp)
    local backup_file_name = ID_MAPPING_CACHE_PATH .. "_BACKUP_" .. time_string

    file.Write(backup_file_name .. ".json", util.TableToJSON(connections, true))
    logInfo("Wrote Backup for Discord ConnectionIDs to " .. backup_file_name)
end

function loadConnectionIDs()
    logInfo("Trying to Load connection IDs")
    local id_mapping_cache = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")

    if not id_mapping_cache then
        logError("Something went wrong while Reading cache file")
        return
    end

    local json_id_mapping_cache = util.JSONToTable(id_mapping_cache, false, true)

    _G.id_mapping = json_id_mapping_cache
    logInfo("Loaded cache info id_mapping")
end

function writeConnectionIDs()
    local json_table = util.TableToJSON(_G.id_mapping, true)
    file.Write(ID_MAPPING_CACHE_PATH .. ".json", json_table)

    local written_connections = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")

    if written_connections == util.TableToJSON(_G.id_mapping, true) then
        logInfo("Wrote Cache to " .. ID_MAPPING_CACHE_PATH)
    else
        logError("Failed writing to cach file " .. ID_MAPPING_CACHE_PATH)
    end
end

function clearConnectionIDs()
    logInfo("Clearing Connection IDs")

    _G.id_mapping = {}
    writeConnectionIDs()
end

function addConnectionID(ply, discordID)
    logInfo("Adding new Connection id for player " .. ply:Nick() .. " with discord id " .. discordID)

    _G.id_mapping[playerIdToString(ply)] = discordID
    writeConnectionIDs()
end

function removeConnectionID(ply)
    logInfo("Removing " .. ply:Nick() .. " from Discord Mapping")

    _G.id_mapping[playerIdToString(ply)] = nil
    writeConnectionIDs()
end

function containsConnectionID(ply)
    logInfo("Checking if player " .. ply:Nick() .. " exists in discord mapping")

    return _G.id_mapping[playerIdToString(ply)] ~= nil
end

function getIdMappingByPlayer(ply)
    logInfo("Retrieving player id for " .. ply:Nick())

    return _G.id_mapping[playerIdToString(ply)]
end

function autoMapPlayer(ply)
    logInfo("Trying to automatically assign player a discord ID")

    if containsConnectionID(ply) then return end

    if not GetConVar(con_vars.AUTO_CONNECT):GetBool() then
        return
    end

    discordRequest("connect", {
        tag = ply:Nick()
    }, function(response)
        if response.tag and response.id then
            addConnectionID(ply, response.id)
            logInfo("Player " .. ply:Nick() .. " with id " .. playerIdToString(ply) .. " got bound to discord id " .. response.id)
        end
    end)
end