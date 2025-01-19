include("utils/logging.lua")
include("utils/muting.lua")

hook.Add("TTT2PrePrepareRound", "MuterPreBeginRound", function(duration)
    logInfo("Pre Prepare Round")
    unmuteAll()
end)

hook.Add("TTT2PreEndRound", "MuterPreBeginRonud", function(result, duration)
    logInfo("Pre End Round")
    unmuteAll()
end)

hook.Add("TTT2PostPlayerDeath", "MuterPostPlayerDeath", function(victim, inflictor, attacker)
    logInfo("Post Player Death")
    mutePlayer(victim)
end)

hook.Add("PlayerSpawn", "MuterPlayerSpawn", function(ply, transition)
    logInfo("Spawn")
    unmutePlayer(ply)
end)

hook.Add("PlayerInitialSpawn", "MuterPlayerInitialSpawn", function(ply ,transition)
    logInfo("Initial Spawn")
    unmutePlayer(ply)
end)