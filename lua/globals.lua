include("discord_integration/sv_discord_id_caching.lua")

globals = {
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
}

return globals