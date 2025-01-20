print("DISCORD LOADED CLIENT")

concommand("commandname", function(ply, cmd, args, str)
    print("CLIENT")
    print(ply:Nick(), cmd)
    PrintTable(args)
end)