globals = include("globals.lua")

print("LOGGING")
print(GetConVar(globals.con_vars.DEBUG))
print(GetConVar(globals.con_vars.DEBUG):GetBool())
print(GetConVar(globals.con_vars.DEBUG):GetInt())
print(GetConVar(globals.con_vars.DEBUG):GetString())
print("########")
function log_debug(...)
    print("DISCORD DEBUG LOGGING", ...)
    local isDebuggingEnabled = GetConVar(globals.con_vars.DEBUG):GetBool()

    print("DEBUGGING ENABLED:")
    print(tostring(isDebuggingEnabled))
    print("########")

    local currentTime = os.date("%Y-%m-%d %H:%M:%S")

    if isDebuggingEnabled then
        print(("%s [discord_muter_v2]: "):format(currentTime), ...)
    end
end