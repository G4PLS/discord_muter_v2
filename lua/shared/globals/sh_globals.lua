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
        SET_DEBUG = "net_sv_muter_debug",
        SET_LOG_TIME = "net_sv_muter_log_time",
        SET_LOG_LEVELS = "net_sv_muter_log_levels",
        SET_BOT_ENDPOINT = "net_sv_muter_bot_endpoint",
        SET_BOT_API_KEY = "net_sv_muter_bot_api_key",
        SET_SERVER_LINK = "net_sv_muter_server_link",
        SET_MUTER_ENABLED = "net_sv_muter_enable_muter",
        SET_MUTE_DURATION = "net_sv_muter_mute_duration",
        SET_AUTO_CONNECT = "net_sv_muter_auto_connect",

        ADD_USER_DISCORD_ID = "net_sv_muter_add_user_discord_id",
        REMOVE_USER_DISCORD_ID = "net_sv_muter_remove_user_discord_id",
        CLEAR_USER_DISCORD_ID = "net_sv_muter_clear_user_discord_id"
    },
    -- Client Receiving
    client = {}
}