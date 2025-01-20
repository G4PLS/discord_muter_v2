local logger = include("utils/logger.lua")
include("utils/muting.lua")

hook.Add("TTT2PrePrepareRound", "MuterPreBeginRound", function(duration)
    logger.logInfo("Pre Prepare Round")
    unmuteAll()
end)

hook.Add("TTT2PreEndRound", "MuterPreBeginRonud", function(result, duration)
    logger.logInfo("Pre End Round")
    unmuteAll()
end)

hook.Add("TTT2PostPlayerDeath", "MuterPostPlayerDeath", function(victim, inflictor, attacker)
    logger.logInfo("Post Player Death")
    mutePlayer(victim)
end)

hook.Add("PlayerSpawn", "MuterPlayerSpawn", function(ply, transition)
    logger.logInfo("Spawn")
    unmutePlayer(ply)
end)

hook.Add("PlayerInitialSpawn", "MuterPlayerInitialSpawn", function(ply ,transition)
    logger.logInfo("Initial Spawn")
    unmutePlayer(ply)
end)