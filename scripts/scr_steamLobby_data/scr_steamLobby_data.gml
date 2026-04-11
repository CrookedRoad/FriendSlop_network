///@function 
function scr_steamLobby_data(argument0){
switch(argument0)
{
	case "init":
	enum packetType_host {
		ping,
		pong,
		getPlayers,
		playerSync
	}
	enum packetType_client {
		ping,
		pong,
		playerInit,
		playerSync
	}
	
	global.mp_lobby_playersList = ds_list_create();
	global.mp_lobby_list = ds_list_create();
	global.mp_steam_netBuffer = buffer_create(1024, buffer_grow, 1);
	scr_steamLobby_data("default");
	break;
	case "default":
	global.mp_playerLimit = 2;
	global.mp_lobbyType = "public";
	global.mp_lobby_id = 0;
	global.mp_lobby_host_id = 0;
	global.mp_lobby_name = "my mommy";
	global.mp_lobby_userPermissions = "";
	global.mp_lobby_room = lobby_rm;
	global.mp_lobby_key = "";
	global.mp_tickrate = 2;
	
	if ds_exists(global.mp_lobby_list, ds_type_list){
		ds_list_clear(global.mp_lobby_list);
	}
	if ds_exists(global.mp_lobby_playersList, ds_type_list){
		ds_list_clear(global.mp_lobby_playersList);
	}
	break;
	case "clear":
	if (buffer_exists(global.mp_steam_netBuffer)){
		buffer_delete(global.mp_steam_netBuffer);
	}
	break;
}
}