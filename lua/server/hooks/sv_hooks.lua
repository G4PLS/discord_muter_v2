include("server/util/sv_muting.lua")
include("server/util/sv_id_mapping.lua")
include("shared/logging/sh_logger.lua")

hook.Add("TTT2PrePrepareRound", "MuterPreBeginRound", function(duration)
    logDebug("Round is Preparing")
    unmuteAll()
end)

hook.Add("TTT2PreEndRound", "MuterPreBeginRonud", function(result, duration)
    logDebug("Round is Ending")
    unmuteAll()
end)

hook.Add("TTT2PostPlayerDeath", "MuterPostPlayerDeath", function(victim, inflictor, attacker)
    logInfo("Player " .. victim:Nick() .. " died")
    mutePlayer(victim)
end)

hook.Add("PlayerSpawn", "MuterPlayerSpawn", function(ply, transition)
    logInfo("Player " .. ply:Nick() .. " Spawned")
    unmutePlayer(ply)
end)

hook.Add("PlayerInitialSpawn", "MuterPlayerInitialSpawn", function(ply ,transition)
    logInfo("Initial Spawn of Player " .. ply:Nick())
    autoMapPlayer(ply)
    unmutePlayer(ply)
end)