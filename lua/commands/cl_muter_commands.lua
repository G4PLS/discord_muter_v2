concommand.Add(globals.con_vars.MUTE_ROUND,
function(ply, cmd, args, argStr)
    local mute_round = args[1] == "1"

    net.Start(globals.network.server.MUTE_ROUND)
    net.WriteBit(mute_round)
    net.SendToServer()
end,
function(cmd, argStr, args)
    return {
        globals.con_vars.MUTE_ROUND .. ' ' .. "1",
        globals.con_vars.MUTE_ROUND .. ' ' .. "0"
    }
end)