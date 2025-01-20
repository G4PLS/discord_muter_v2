include("muter_globals/sh_globals.lua")

logger = logger or {}

logger.log_levels = logger.log_levels or {}

logger.shouldLog = function()
    local isDebuggingEnabled = GetConVar(con_vars.DEBUG):GetBool()

    if isDebuggingEnabled == nil then
        isDebuggingEnabled = false
    end

    return isDebuggingEnabled
end

logger.shouldLogTime = function()
    local shouldLogTime = GetConVar(con_vars.LOG_TIME):GetBool()

    if shouldLogTime == nil then
        shouldLogTime = false
    end

    return shouldLogTime
end

logger.setLogLevels = function(log_levels, delimiter)
    local result = {}
    print("DISCORD SETTING LEVELS")
    for match in (log_levels .. delimiter):gmatch("(.-)" .. delimiter) do
        result[match] = true
        print(tostirng(match))
    end
    logger.log_levels = result
end

logger.containsLogLevel = function(log_level)
    if logger.log_levels == nil then
        return false
    end

    print("DISCORD CONTAINS LOG LEVEL")
    print(tostring(logger.log_levels[log_level] ~= nil))

    return logger.log_levels[log_level] ~= nil
end

logger.print = function(log_level, msg)
    if not logger.containsLogLevel(log_level) then
        return
    end

    if not logger.shouldLog() then return end

    log_message = string.format("[discord_muter_v2 %s]: %s", log_level, msg)

    if logger.shouldLogTime() then
        local current_time = os.date("%Y-%m-%d %H:%M:%S")
        log_message = string.format("[%s] %s", current_time, log_message)
    end

    print(log_message)
end

logger.logInfo = function(...)
    print("DISCORD LOGGING INFO")
    logger.print("INFO", ...)
end

logger.logWarning = function(...)
    logger.print("WARNING", ...)
end

logger.logDebug = function(...)
    logger.print("DEBUG", ...)
end

logger.logError = function(...)
    logger.print("ERROR", ...)
end

return logger