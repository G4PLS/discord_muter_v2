con_vars = {
    DEBUG = "discord_muter_debug",
    LOG_TIME = "discord_muter_log_time",
    LOG_LEVELS = "discord_muter_log_levels",

    BOT_ENDPOINT = "discord_muter_endpoint",
    BOT_API_KEY = "discord_muter_api_key",
    SERVER_LINK = "discord_muter_server_link",

    ENABLE_MUTER = "discord_muter_enabled",
    MUTE_DURATION = "discord_muter_mute_duration", -- 0 -> To end of round
    AUTO_CONNECT = "discord_muter_auto_connect"
}

-- TODO: Add network string for muter dart
network = {
    -- Server Receiving
    server = {
        DEBUG = "net_sv_muter_debug",
        LOG_TIME = "net_sv_muter_log_time",
        LOG_LEVELS = "net_sv_muter_log_levels",
        BOT_ENDPOINT = "net_sv_muter_bot_endpoint",
        BOT_API_KEY = "net_sv_muter_bot_api_key",
        SERVER_LINK = "net_sv_muter_server_link",
        ENABLE_MUTER = "net_sv_muter_enable_muter",
        MUTE_DURATION = "net_sv_muter_mute_duration",
        AUTO_CONNECT = "net_sv_muter_auto_connect"
    },
    -- Client Receiving
    client = {}
}