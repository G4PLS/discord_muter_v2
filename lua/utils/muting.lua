include("muter_globals/sh_globals.lua")
include("utils/id_helper.lua")
include("discord_integration/sv_id_mapper.lua")

local logger = include("utils/logger.lua")

function sendHttpRequest(ply, msg)
    if not containsConnectionID(ply) then
        logger.logError("Cant send http Request, id mappings dont contain player " .. tostring(ply:Nick()))
        return
    end

    httpFetch("mute", {
        mute = getMuteStatus(ply),
        id = getIdMappingByPlayer(ply)
    }, function(response)
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

    logger.logError("Player is not Valid!")
    return false
end

function setMuteStatus(ply, status)
    if not checkValidPlayer(ply) then
        logger.logError("Wasnt able to set player Status")
    end

    _G.muted_players[playerIdToString(ply)] = status

    logger.logInfo("Set Mute Status of " .. tostring(ply:Nick()) .. " to " .. tostring(status))
end

function getMuteStatus(ply)
    if not checkValidPlayer(ply) then
        logger.logError("Wasnt able to get mute status for player, returning false")
        return false
    end

    status = _G.muted_players[playerIdToString(ply)]

    if status == nil then
        status = false
    end

    logger.logDebug("Mute status of " .. tostring(ply:Nick()) .. " is: " .. tostring(status))

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