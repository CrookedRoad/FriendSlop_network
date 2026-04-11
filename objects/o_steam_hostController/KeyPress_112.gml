/// @description Отправка инвайта
var _my_id = steam_get_user_steam_id();
var _b = buffer_create(1, buffer_grow, 1);
buffer_write(_b, buffer_string, "test");
var _success = steam_net_packet_send(int64(_my_id), _b, buffer_get_size(_b), 2);
buffer_delete(_b);
show_debug_message("Отправка самому себе: " + string(_success));
	
/*
if global.mp_lobby_id != 0{
	steam_lobby_activate_invite_overlay();
}