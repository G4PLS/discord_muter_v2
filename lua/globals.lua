globals = {
    con_vars = {
        DEBUG = "discord_muter_debug",
        LOG_TIME = "discord_muter_log_time",
        LOG_LEVELS = "discord_muter_log_levels",
        ENDPOINT = "discord_muter_endpoint",
        API_KEY = "discord_muter_api_key",
        DISCORD_NAME = "discord_muter_name",
        SERVER_LINK = "discord_muter_server_link",
        MUTE_ROUND = "discord_muter_muter_round",
        MUTE_DURATION = "discord_muter_mute_duration",
        AUTO_CONNECT = "discord_muter_auto_connect"
    },
    network_strings = {
        DRAW_MUTE = "drawMute",
        CONNECT_DISCORD_ID = "connectDiscordID",
        PLAYER_TABLE = "discordPlayerTable",
        REQUEST_PLAYER_TABLE = "request_discordPlayerTable",
        TEST_CONNECTION = "discordTestConnection",
        REQUEST_TEST_CONNECTION = "request_discordTestConnection",
        ADDON_VERSION = "addonVersion",
        REQUEST_ADDON_VERSION = "request_addonVersion",
        BOT_VERSION = "botVersion",
        REQUEST_BOT_VERSION = "request_botVersion"
    },
    network = {
        -- Net Recieve Server
        server = {
            DEBUG = "net_sv_muter_debug",
            LOG_TIME = "net_sv_muter_log_time",
            LOG_LEVELS = "net_sv_muter_log_levels",
            MUTE_ROUND = "net_sv_muter_mute_round",
            MUTE_DURATION = "net_sv_muter_mute_duration",
            AUTO_CONNECT = "net_sv_muter_auto_connect"
        },
        -- Net Recieve Client
        client = {
        }
    },
    muted_players = {}, -- (str, bool) | SteamID - Mute Status
    id_mapping = {}, -- (str, str) | SteamID - DiscordID
}

globals.idMappingContainsPlayer = function(ply)
    local id = globals.id_mapping[ply:SteamID64()]

    if id == nil then
        return false
    else
        return true
    end
end

return globals