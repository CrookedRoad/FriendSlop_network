var type = async_load[? "event_type"];

if (type == "lobby_chat_update"){
var user_id = async_load[? "user_id"];
var change_flags = async_load[? "change_flags"];

	if (change_flags == steam_lobby_member_change_entered){ //Игрок вошел в лобби
		if instance_exists(o_players_spawnPoint){
		var inst = instance_create_depth(o_players_spawnPoint.x, o_players_spawnPoint.y, 0, o_player_other);
		    inst.ownerSteam_id = user_id;
		}
		
	    show_debug_message("Player is connected: " + string(user_id));
		if ds_exists(global.mp_lobby_playersList, ds_type_list){ //Добавляем игрока в список
			ds_list_add(global.mp_lobby_playersList, user_id);
		}
	}
	if (change_flags == steam_lobby_member_change_left || change_flags == steam_lobby_member_change_disconnected){ //Игрок отключился		
		show_debug_message("Player is leaved: " + string(user_id));
		if (user_id == steam_lobby_get_owner_id()) { //Если отключился хост лобби
			show_debug_message("Connection with the host was lost.");
			scr_roomGoto(mainScreen_rm, -1, -1, -1);
		} else{ //Если отключился обычный игрок
			if instance_exists(o_player_other){
				with(o_player_other){
					if (ownerSteam_id == user_id) then instance_destroy();
				}
			}
			if ds_exists(global.mp_lobby_playersList, ds_type_list){ //Удаляем игрока из списка
			var listSize = ds_list_size(global.mp_lobby_playersList);
				for(var i=0; i<listSize; i++)
				{
					if (global.mp_lobby_playersList[| i] == user_id){
						ds_list_delete(global.mp_lobby_playersList, i);
					}
				}
			}
		}
	}
}