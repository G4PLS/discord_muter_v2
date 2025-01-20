include("shared/globals/sh_globals.lua")

function isLoggingEnabled()
    return GetConVar(con_vars.DEBUG):GetBool() or false
end

function isTimestampEnabled()
    return GetConVar(con_vars.LOG_TIME):GetBool() or false
end

function containsLogLevel(log_level)
    local log_level_string = GetConVar(con_vars.LOG_LEVELS)

    local log_levels = {}
    for match in (log_level_string .. '|'):gmatch("(.-)" .. '|') do
        log_levels[match] = true
    end

    return log_levels[log_level] ~= nil
end

function printLog(log_level, msg)
    if not containsLogLevel(log_level) or not isLoggingEnabled() then
        return
    end

    log_message = string.format("[discord_muter_v2 %s]: %s", log_level, msg)

    if isTimestampEnabled() then
        local current_time = os.date("%Y-%m-%d %H:%M:%S")
        log_message = string.format("[%s] %s", current_time, log_message)
    end

    print(log_message)
end

function logInfo(...)
    printLog("INFO", ...)
end

function logWarning(...)
    printLog("WARNING", ...)
end

function logDebug(...)
    printLog("DEBUG", ...)
end

function logError(...)
    printLog("ERROR")
end

function logTable(tbl, tbl_name)
    if not isLoggingEnabled() then
        return
    end

    logDebug("Printing table: " .. tbl_name)
    PrintTable(tbl)
end
