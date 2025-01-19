include("utils/logging.lua")
include("utils/muting.lua")

hook.Add("TTT2PrePrepareRound", "MuterPreBeginRound", function(duration)
    unmuteAll()
end)

hook.Add("TTT2PreEndRound", "MuterPreBeginRonud", function(result, duration)
    unmuteAll()
end)

hook.Add("TTT2PostPlayerDeath", "MuterPostPlayerDeath", function(victim, inflictor, attacker)
    mutePlayer(victim)
end)

hook.Add("PlayerSpawn", "MuterPlayerSpawn", function(ply, transition)
    unmutePlayer(ply)
end)

hook.Add("PlayerInitialSpawn", "MuterPlayerInitialSpawn", function(ply ,transition)
    unmutePlayer(ply)
end)