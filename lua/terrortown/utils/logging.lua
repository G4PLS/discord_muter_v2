CreateConVar("discord_debug", 0, FCVAR_UNREGISTERED, "Print debug messages to the Console")

function log_debug(...)
    local isDebuggingEnabled = GetConVar("DiscordDebug"):GetBool()
    local currentTime = os.date("%Y-%m-%d %H:%M:%S")

    if isDebuggingEnabled then
        print(("%s [discord_muter_v2]: "):format(currentTime), ...)
    end
end