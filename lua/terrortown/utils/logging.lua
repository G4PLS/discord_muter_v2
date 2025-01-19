globals = include("terrortown/autorun/globals.lua")

function log_debug(...)
    local isDebuggingEnabled = GetConVar(globals.con_vars.DEBUG):GetBool()
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")

    if isDebuggingEnabled then
        print(("%s [discord_muter_v2]: "):format(currentTime), ...)
    end
end