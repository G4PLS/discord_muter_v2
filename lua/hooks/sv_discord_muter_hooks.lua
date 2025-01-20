local logger = include("utils/logger.lua")
include("utils/muting.lua")
include("discord_integration/sv_id_mapper.lua")

hook.Add("TTT2PrePrepareRound", "MuterPreBeginRound", function(duration)
    logger.logInfo("Round is Preparing")
    unmuteAll()
end)

hook.Add("TTT2PreEndRound", "MuterPreBeginRonud", function(result, duration)
    logger.logInfo("Round is Ending")
    unmuteAll()
end)

hook.Add("TTT2PostPlayerDeath", "MuterPostPlayerDeath", function(victim, inflictor, attacker)
    logger.logInfo("Player " .. victim:Nick() .. "died")
    mutePlayer(victim)
end)

hook.Add("PlayerSpawn", "MuterPlayerSpawn", function(ply, transition)
    logger.logInfo(ply:Nick() .. " Spawned")
    unmutePlayer(ply)
end)

hook.Add("PlayerInitialSpawn", "MuterPlayerInitialSpawn", function(ply ,transition)
    logger.logInfo("Initial Spawn of player: " .. ply:Nick())
    autoMapPlayer(ply)

    unmutePlayer(ply)
end)