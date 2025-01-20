print("DISCORD LOADED CLIENT")

concommand.Add( "clientmand", function( ply, cmd, args, str )
    net.Start("ServerCMD")
    net.WriteString("THIS IS FROM clientmand")
    net.SendToServer()
 end )