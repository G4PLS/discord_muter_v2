print("DISCORD LOADED CLIENT")

concommand.Add( "clientmand", function( ply, cmd, args, str )
    print("CLIENT")
    print( ply:Nick(), cmd )
    PrintTable( args )
 end )