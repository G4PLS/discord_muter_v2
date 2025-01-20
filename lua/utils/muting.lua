include("muter_globals/sh_globals.lua")
include("muter_globals/sv_globals.lua")

local logger = include("utils/logger.lua")

function sendHttpRequest(ply, msg)
    if not idMappingContainsPlayer(ply) then
        logger.logError("Cant send http Request, id mappings dont contain player " .. tostring(ply:Nick()))
        return
    end

    local player_id = playerIdToString(ply)

    httpFetch("mute", {
        mute = getMuteStatus(ply),
        id = id_mapping[player_id]
    }, function(response)
        if not getLogStatus() then
            return
        end

        if response and response.success then
            logger.logInfo("Http Response was OK, player mute state should be changed in discord")
        else
            logger.logError("Http Response was NOT OK, player mute state probably didnt get changed")
        end
    end)
end

function checkValidPlayer(ply)
    if IsValid(ply) then
        return true
    end

    if getLogStatus() then
        logger.logError("Player is not Valid!")
        return false
    end
end

function setMuteStatus(ply, status)
    if not checkValidPlayer(ply) then
        logger.logError("Wasnt able to set player Status")
    end

    local player_id = playerIdToString(ply)

    muted_players[player_id] = status
    logger.logInfo("Set Mute Status of " .. tostring(ply:Nick()) .. " to " .. tostring(status))
end

function getMuteStatus(ply)
    if not checkValidPlayer(ply) then
        logger.logError("Wasnt able to get mute status for player, returning false")
        return false
    end

    local player_id = playerIdToString(ply)

    status = muted_players[player_id]

    if status == nil then
        status = false
    end

    if getLogStatus() then
        logger.logDebug("Mute status of " .. tostring(ply:Nick()) .. " is: " .. tostring(status))
    end

    return status
end

function mutePlayer(ply)
    logger.logInfo("Muting Player")

    setMuteStatus(ply, true)

    local duration = GetConVar(con_vars.MUTE_DURATION):GetInt()

    if duration > 0 then
        timer.Simple(duration, function() unmutePlayer(ply) end)
    end
end

function unmutePlayer(ply)
    logger.logInfo("Unmuting Player")

    setMuteStatus(ply, false)
    sendHttpRequest(ply, "Muting Player")
end

function muteAll()
    logger.logInfo("Muting every Player")
    local players = player.GetAll()

    for _, ply in ipairs(players) do
        mutePlayer(ply)
    end
end

function unmuteAll()
    logger.logInfo("Unmuting every Player")
    local players = player.GetAll()

    for _, ply in ipairs(players) do
        unmutePlayer(ply)
    end
end