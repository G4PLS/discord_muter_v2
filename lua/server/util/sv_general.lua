include("shared/globals/sh_globals.lua")

-- 1=Waiting | 2=Prep | 3=Active | 4=Post
function getRoundState()
    if gmod.GetGamemode().Name == "TTT2" or gmod.GetGamemode().Name == "TTT2 (Advanced Update)" then
        return GetRoundState()
    end

    return nil
end

function isRoundRunning()
    return getRoundState() == 3
end

function canMute()
    return GetConVar(con_vars.ENABLE_MUTER):GetBool() or false
end