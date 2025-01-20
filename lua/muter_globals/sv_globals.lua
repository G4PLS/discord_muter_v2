include("discord_integration/sv_discord_id_caching.lua")

muted_players = {} -- (str, bool) | SteamID - Mute Status
id_mapping = getConnectionIDs() or {} -- (str, str) | SteamID - DiscordID

function playerIdToString(ply)
    if not IsValid(ply) then
        return ""
    end

    return tostring(ply:SteamID64())
end

function idMappingContainsPlayer(ply)
    local player_id = playerIdToString(ply)
    local id = id_mapping[player_id]

    if id == nil then
        return false
    else
        return true
    end
end