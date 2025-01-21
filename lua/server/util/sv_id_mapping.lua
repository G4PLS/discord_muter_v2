include("shared/globals/sh_globals.lua")
include("server/discord/sv_discord_requests.lua")
include("shared/logging/sh_logger.lua")

local ID_MAPPING_CACHE_PATH = "discord_connection_cache"

function playerIdToString(ply)
    return tostring(ply:SteamID64())
end

function backupConnectionIDs(connections)
    local timestamp = os.time()
    local time_string = os.date("%Y-%m-%d", timestamp)
    local backup_file_name = ID_MAPPING_CACHE_PATH .. "_BACKUP_" .. time_string

    file.Write(backup_file_name .. ".json", util.TableToJSON(connections, true))
end

function loadConnectionIDs()
    local id_mapping_cache = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")

    if not id_mapping_cache then
        logError("Something went wrong while Reading cache file")
        return
    end

    local json_id_mapping_cache = util.JSONToTable(id_mapping_cache, false, true)

    _G.id_mapping = json_id_mapping_cache
end

function writeConnectionIDs()
    local json_table = util.TableToJSON(_G.id_mapping, true)
    file.Write(ID_MAPPING_CACHE_PATH .. ".json", json_table)

    local written_connections = file.Read(ID_MAPPING_CACHE_PATH .. ".json", "DATA")

    if written_connections == util.TableToJSON(_G.id_mapping, true) then
        logDebug("Wrote Cache to " .. ID_MAPPING_CACHE_PATH)
    else
        logError("Failed writing to cach file " .. ID_MAPPING_CACHE_PATH)
    end
end

function clearConnectionIDs()
    _G.id_mapping = {}
    writeConnectionIDs()
end

function addConnectionID(ply, discordID)
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
    if ply:IsBot() then return end

    if containsConnectionID(ply) then return end

    if not GetConVar(con_vars.AUTO_CONNECT):GetBool() then
        return
    end

    discordRequest("connect", {
        tag = ply:Nick()
    }, function(response)
        if response.tag and response.id then
            addConnectionID(ply, response.id)
        end
    end)
end