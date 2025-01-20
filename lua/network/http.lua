local logger = include("utils/logger.lua")
local globals = include("globals.lua")

function httpFetch(req, params, callback, tries)
    local default_tries = 3
    httpsAdress = GetConVar(globals.con_vars.ENDPOINT):GetString()
    http.Fetch(httpsAdress .. "/" .. req, function(res)
        if util.JSONToTable(res).errorMsg then logger.logError(util.JSONToTable(res).errorMessage) end
        callback(util.JSONToTable(res))
    end, function(err)
        logger.logError("Request to bot failed! Is the bot running?")
        logger.logError(err)
        if not tries then tries = default_tries end
        if tries ~= 0 then httpFetch(req, params, callback, tries - 1) end
    end, {
        ["req"] = req,
        ["authorization"] = "Basic " .. GetConVar(globals.con_vars.API_KEY):GetString(),
        ["params"] = util.TableToJSON(params)
    })
end