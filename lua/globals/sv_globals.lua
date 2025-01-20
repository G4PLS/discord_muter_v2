include("discord_integration/sv_discord_id_caching.lua")

muted_players = {} -- (str, bool) | SteamID - Mute Status
id_mapping = getConnectionIDs() -- (str, str) | SteamID - DiscordID

function idMappingContainsPlayer(ply)
    local id = globals.id_mapping[ply:SteamID64()]

    if id == nil then
        return false
    else
        return true
    end
end