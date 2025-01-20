include("muter_globals/sh_globals.lua")
include("utils/id_helper.lua")
include("discord_integration/sv_id_mapper.lua")
include("network/http.lua")

local logger = include("utils/logger.lua")

function canMute()
    local muting_enabled = GetConVar(con_vars.ENABLE_MUTER):GetBool()

    if not muting_enabled then
        logger.logDebug("Muting is Disabled")
    end

    return muting_enabled
end

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
            logger.logInfo("Http Response was OK, " .. ply:Nick() .. " mute state should be changed in discord")
        else
            logger.logError("Http Response was NOT OK, " .. ply:Nick() .. " mute state probably didnt get changed")
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
    if not canMute() then return end

    logger.logInfo("Muting Player")

    setMuteStatus(ply, true)
    sendHttpRequest(ply, "Muting Player")

    local duration = GetConVar(con_vars.MUTE_DURATION):GetInt()

    if duration > 0 then
        timer.Simple(duration, function() unmutePlayer(ply) end)
    end
end

function unmutePlayer(ply)
    if not canMute() then return end

    logger.logInfo("Unmuting Player")

    setMuteStatus(ply, false)
    sendHttpRequest(ply, "Muting Player")
end

function muteAll()
    if not canMute() then return end

    logger.logInfo("Muting every Player")
    local players = player.GetAll()

    for _, ply in ipairs(players) do
        mutePlayer(ply)
    end
end

function unmuteAll()
    if not canMute() then
        return
    end

    logger.logInfo("Unmuting every Player")
    local players = player.GetAll()

    for _, ply in ipairs(players) do
        unmutePlayer(ply)
    end
end