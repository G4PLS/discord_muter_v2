include("shared/globals/sh_globals.lua")
include("server/util/sv_id_mapping.lua")
include("server/discord/sv_discord_requests.lua")
include("shared/logging/sh_logger.lua")

--local logger = include("utils/logger.lua")

function canMute()
    return GetConVar(con_vars.ENABLE_MUTER):GetBool() or false
end

function discordMute(ply)
    logInfo("Trying to send mute request to discord")

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
    logInfo("Checking if player is valid before muting")

    local player_valid = IsValid(ply)

    if player_valid == false then
        logError("Player is not valid")
    end

    return player_valid
end

function setMuteStatus(ply, status)
    if not checkValidPlayer(ply) then
        return
    end

    logInfo("Setting mute status for player " .. ply:Nick() .. " to " .. tostring(status))

    _G.muted_players[playerIdToString(ply)] = status
end

function getMuteStatus(ply)
    logInfo("Getting mute status for player")

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
    if not canMute() then return end

    logInfo("Trying to mute Player " .. ply:Nick())

    setMuteStatus(ply, true)
    discordMute(ply)

    local duration = GetConVar(con_vars.MUTE_DURATION):GetInt()

    if duration > 0 then
        timer.Simple(duration, function() unmutePlayer(ply) end)
    end
end

function unmutePlayer(ply)
    if not canMute() then return end

    logInfo("Trying to unmute player " .. ply:Nick())

    setMuteStatus(ply, false)
    discordMute(ply)
end

function muteAll()
    if not canMute() then return end

    logInfo("Trying to mute every Player")

    local players = player.GetAll()

    for _, ply in ipairs(players) do
        mutePlayer(ply)
    end
end

function unmuteAll()
    if not canMute() then return end

    logInfo("Trying to unmute every player")

    local players = player.GetAll()

    for _, ply in ipairs(players) do
        unmutePlayer(ply)
    end
end