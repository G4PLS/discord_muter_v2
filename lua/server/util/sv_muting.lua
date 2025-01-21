include("shared/globals/sh_globals.lua")
include("server/util/sv_id_mapping.lua")
include("server/util/sv_general.lua")
include("server/discord/sv_discord_requests.lua")
include("shared/logging/sh_logger.lua")

function discordMute(ply)
    discordRequest("mute", {
        mute = getMuteStatus(ply),
        id = getIdMappingByPlayer(ply)
    }, function(response)
        if response and response.success then
            logInfo("Http response was OK!")
        else
            logError("Http response was NOT OK")
        end
    end)
end

function checkValidPlayer(ply)
    local player_valid = IsValid(ply) or not ply:IsBot()

    if player_valid == false then
        logError("Player is not valid")
    end

    return player_valid
end

function setMuteStatus(ply, status)
    if not checkValidPlayer(ply) then
        return
    end
    logDebug("Set mute status for player " .. ply:Nick() .. " to " .. tostring(status))
    _G.muted_players[playerIdToString(ply)] = status
end

function getMuteStatus(ply)
    if not checkValidPlayer(ply) then
        logError("Wasnt able to get mute status for player, returning false")
        return false
    end

    status = _G.muted_players[playerIdToString(ply)]

    if status == nil then
        logError("Wasnt able to get mute status for player " .. ply:Nick())
        status = false
    end

    return status
end

function mutePlayer(ply)
    if isRoundRunning() or ply:IsBot() then return end

    logInfo("Muting player " .. ply:Nick())

    setMuteStatus(ply, true)
    discordMute(ply)

    local duration = GetConVar(con_vars.MUTE_DURATION):GetInt()

    if duration > 0 then
        timer.Simple(duration, function() unmutePlayer(ply) end)
    end
end

function unmutePlayer(ply)
    if ply:IsBot() then return end
    logInfo("Unmuting player " .. ply:Nick())

    setMuteStatus(ply, false)
    discordMute(ply)
end

function muteAll()
    local players = player.GetAll()

    for _, ply in ipairs(players) do
        mutePlayer(ply)
    end
end

function unmuteAll()
    local players = player.GetAll()

    for _, ply in ipairs(players) do
        unmutePlayer(ply)
    end
end