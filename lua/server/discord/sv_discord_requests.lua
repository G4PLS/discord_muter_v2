include("shared/globals/sh_globals.lua")
include("shared/logging/sh_logger.lua")

function discordRequest(req, params, callback, tries)
    local default_tries = 3

    local bot_endpoint = GetConVar(con_vars.BOT_ENDPOINT):GetString()
    http.Fetch(bot_endpoint .. "/" .. req, function(response)
        local response_table = util.JSONToTable(response)

        if response_table.errorMsg then
            logError("Error while fetching " .. tostring(response_table.errorMsg))
        end
    end, function(err)
        logError("Request to bot failed! Is the bot running?")
        logError(err)

        if not tries then
            tries = default_tries
        end
        if tries ~= 0 then
            baseRequest(req, params, callback, tries - 1)
        end
    end, {
        ["req"] = req,
        ["authorization"] = "Basic " .. GetConVar(con_vars.BOT_API_KEY):GetString(),
        ["params"] = util.TableToJSON(params)
    })
end