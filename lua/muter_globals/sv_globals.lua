include("discord_integration/sv_discord_id_caching.lua")

muted_players = {} -- (str, bool) | SteamID - Mute Status
id_mapping = getConnectionIDs() or {} -- (str, str) | SteamID - DiscordID

function idMappingContainsPlayer(ply)
    print("DISCORD ID MAPPING CONTAINS")
    PrintTable(id_mapping)
    print(ply:Nick())
    print(ply:SteamID64())
    print("#########################")

    local id = id_mapping[ply:SteamID64()]

    if id == nil then
        return false
    else
        return true
    end
end