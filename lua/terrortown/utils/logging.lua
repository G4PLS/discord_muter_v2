CreateConVar("DiscordDebug", false, FCVAR_UNREGISTERED, "Print debug messages to the Console")

function log_debug(...)
    local isDebuggingEnabled = GetConVar("DiscordDebug"):GetBool()
    if isDebuggingEnabled then
        print("[Discord Muter]: ", ...)
    end
end