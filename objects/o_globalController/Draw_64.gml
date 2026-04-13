switch(showGameInfo)
{
    case true:
    var TEXT = "";
        TEXT += "FPS:  "+string(round(fps_real))+"/"+string(fps)+"\n";
        TEXT += "displayResolution:   ("+string(global.display_width)+"*"+string(global.display_height)+")   currentResolution:   ("+string(global.window_width)+"*"+string(global.window_height)+")"+"\n";
        TEXT += "instanceNumber:   "+string(instance_number(all))+"\n";
		if global.cursor_on_object != 0 && instance_exists(global.cursor_on_object){
			TEXT += "cursor_on_object:   "+string(object_get_name(global.cursor_on_object.object_index))+"\n";
		} else{
			TEXT += "cursor_on_object:   noone\n";
		}
		if instance_exists(o_player_local){
			TEXT += "player speedY:   "+string(o_player_local.phy_speed_y)+"\n";
		}
		
		TEXT += "NetworkConnection: "+string(global.networkConnection)+"\n";
		TEXT += "appID: "+string(global.appID)+" ("+string(global.buildType)+")\n";
		TEXT += "steamAPI: "+string(global.steamAPI)+"\n";
		TEXT += "steamUsername: "+string(global.userName)+"\n";
		TEXT += "steamID: "+string(global.steamID)+"\n";
		if global.mp_lobby_id != 0{
			TEXT += "lobbyID: "+string(global.mp_lobby_id)+"\n";
			TEXT += "lobbyHostID: "+string(global.mp_lobby_host_id)+"\n";
			TEXT += "lobbyName: "+string(global.mp_lobby_name)+"\n";
			if global.mp_lobby_key != ""{
				TEXT += "lobbyKey: "+string(global.mp_lobby_key)+"\n";
			}
			TEXT += "userPermissions: "+string(global.mp_lobby_userPermissions)+"\n";
			if ds_exists(global.mp_lobby_playersList, ds_type_list){
			var listSize = ds_list_size(global.mp_lobby_playersList);
				TEXT += "playerList:\n";
				for(var i=0; i<listSize; i++)
				{
					TEXT += string(i)+". player: "+string(global.mp_lobby_playersList[| i])+"\n";
				}
			}
		}
        
        scr_draw_text_to_gui(10, 10, TEXT, 0.15, c_white, 0, 1, -1, -1, c_black, -1);
    break;
}