var type = async_load[? "event_type"];

if (type == "lobby_created") {
var lobby_id = async_load[? "lobby_id"];
	global.mp_lobby_id = lobby_id;
	global.mp_lobby_host_id = steam_lobby_get_owner_id();
	global.mp_lobby_userPermissions = "host";
	global.mp_lobby_key = "lobby_key_"+scr_codeName_generator(15);
	clipboard_set_text(global.mp_lobby_key);
	
	if ds_exists(global.mp_lobby_playersList, ds_type_list){ //Добавляем себя в список игроков
		ds_list_add(global.mp_lobby_playersList, global.mp_lobby_host_id);
	}
	
	steam_lobby_set_data("name", global.mp_lobby_name);
	steam_lobby_set_data("key", global.mp_lobby_key);
	steam_lobby_set_data("status", "in_lobby");
	instance_create_depth(0, 0, 0, o_steam_hostController);
	
	lobby_is_created = true;
	instance_destroy();
}