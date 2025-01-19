local globals = include("globals.lua")

function getLogStatus()
    local isDebuggingEnabled = GetConVar(globals.con_vars.DEBUG):GetBool()

    if isDebuggingEnabled == nil then
        isDebuggingEnabled = false
    end

    return isDebuggingEnabled
end

function logDebug(...)
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")

    if getLogStatus() then
        print(("%s [discord_muter_v2 DEBUG]:"):format(currentTime),...)
    end
end

function logError(...)
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")

    if getLogStatus() then
        print(("%s [discord_muter_v2 ERROR]:"):format(currentTime),...)
    end
end