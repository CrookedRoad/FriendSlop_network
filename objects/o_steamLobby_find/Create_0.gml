depth = -8000;
lobby_key = "";
lobby_is_found = false;
alarm[0] = 5*global.timeSec_const;

steam_lobby_list_add_string_filter("status", "in_lobby");
steam_lobby_list_request();

if ds_exists(global.mp_lobby_list, ds_type_list){
	ds_list_clear(global.mp_lobby_list);
}