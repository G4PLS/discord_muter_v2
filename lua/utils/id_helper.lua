function playerIdToString(ply)
    if not IsValid(ply) then
        return ""
    end

    return tostring(ply:SteamID64())
end