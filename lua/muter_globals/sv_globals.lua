include("discord_integration/sv_discord_id_caching.lua")
include("utils/id_helper.lua")

muted_players = {} -- (str, bool) | SteamID - Mute Status
id_mapping = getConnectionIDs() or {} -- (str, str) | SteamID - DiscordID

function idMappingContainsPlayer(ply)
    local player_id = playerIdToString(ply)
    local id = id_mapping[player_id]

    if id == nil then
        return false
    else
        return true
    end
end