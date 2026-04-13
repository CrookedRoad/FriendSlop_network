/// @description Отправка инвайта
if ds_exists(global.mp_lobby_playersList, ds_type_list){
var playerListSize = ds_list_size(global.mp_lobby_playersList);
	if playerListSize > 1{
		for(var i=0; i<playerListSize; i++)
		{
		var user_id = global.mp_lobby_playersList[| i];
			if user_id != global.steamID{
				scr_steam_request(user_id, packetType.ping);
			}
		}
	}
}

/*
if global.mp_lobby_id != 0{
	steam_lobby_activate_invite_overlay();
}