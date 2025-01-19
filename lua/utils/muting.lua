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
    if checkValidPlayer(ply) then
        globals[tostring(ply:SteamID64())] = status
    end
end

function getMuteStatus(ply)
    if not checkValidPlayer(ply) then
        return false
    end

    status = globals[tostring(ply:SteamID64())]

    if getLogStatus() then
        logDebug("Mute status of player is:" .. tostring(status))
    end

    if status == nil then
        status = false
    end

    return status
end

function mutePlayer(ply)
    setMuteStatus(ply, true)
end

function unmutePlayer(ply)
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