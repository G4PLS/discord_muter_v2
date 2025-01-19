include("utils/logging.lua")
local globals = include("globals.lua")

function checkValidPlayer(ply)
    if IsValid(ply) then
        return true
    end

    if getLogStatus() then
        logError("Player is not Valid!")
        return false
    end
end

function setMuteStatus(ply, status)
    if not checkValidPlayer(ply) then
        logError("Wasnt able to set player Status")
    end

    globals[tostring(ply:SteamID64())] = status
    logInfo("Set " .. tostring(ply:Nick()) .. " to " .. tostring(status))
end

function getMuteStatus(ply)
    if not checkValidPlayer(ply) then
        logError("Wasnt able to get mute status for player, returning false")
        return false
    end

    status = globals[tostring(ply:SteamID64())]

    if status == nil then
        status = false
    end

    if getLogStatus() then
        logDebug("Mute status of" .. tostring(ply:Nick()) .. " is: " .. tostring(status))
    end

    return status
end

function mutePlayer(ply)
    print("DISCORD MUTING PLAYER")
    setMuteStatus(ply, true)
end

function unmutePlayer(ply)
    print("DISCORD UNMUTING PLAYER")
    setMuteStatus(ply, false)
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