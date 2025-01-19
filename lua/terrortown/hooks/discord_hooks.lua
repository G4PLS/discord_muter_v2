include("terrortown/utils/logging.lua")

print("DISCORD PRE DEBUG HOOK")

log_debug("HOOKS V1")

hook.Add("TTT2PrePrepareRound", "MuterPreBeginRound", function(duration)
    log_debug("PRE BEGIN ROUND")
end)

hook.Add("TTT2PreEndRound", "MuterPreBeginRonud", function(result, duration)
    log_debug("PRE END ROUND")
end)

hook.Add("PlayerDeathThink", "DiscordDeathThink", function(player)
    log_debug("PLAYER DEATH THINK")
end)

hook.Add("TTT2PostPlayerDeath", "DiscordPostPlayerDeath", function(victim, inflictor, attacker)
    log_debug("POST PLAYER DEATH")
end)