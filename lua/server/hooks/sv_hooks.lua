include("server/util/sv_muting.lua")
include("server/util/sv_id_mapping.lua")
include("server/util/sv_general.lua")
include("shared/logging/sh_logger.lua")

hook.Add("TTT2PrePrepareRound", "MuterPreBeginRound", function(duration)
    if canMute() then
        unmuteAll()
    end
end)

hook.Add("TTT2PreEndRound", "MuterPreBeginRonud", function(result, duration)
    if canMute() then
        unmuteAll()
    end
end)

hook.Add("TTT2PostPlayerDeath", "MuterPostPlayerDeath", function(victim, inflictor, attacker)
    if canMute() then
        mutePlayer(victim)
    end
end)

hook.Add("PlayerSpawn", "MuterPlayerSpawn", function(ply, transition)
    if canMute() then
        unmutePlayer(ply)
    end
end)

hook.Add("PlayerInitialSpawn", "MuterPlayerInitialSpawn", function(ply ,transition)
    autoMapPlayer(ply)

    if canMute() then
        unmutePlayer(ply)
    end
end)