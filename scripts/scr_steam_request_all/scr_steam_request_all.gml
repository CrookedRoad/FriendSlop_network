///@function scr_steam_request_all(requestName)
function scr_steam_request_all(argument0){
var _request = argument0;
if ds_exists(global.mp_lobby_playersList, ds_type_list){
var playerListSize = ds_list_size(global.mp_lobby_playersList);
if playerListSize > 1{
var _buff = buffer_create(1, buffer_grow, 1);
	buffer_write(_buff, buffer_u8, _request);
	for(var i=0; i<playerListSize; i++)
	{
	var user_id = global.mp_lobby_playersList[| i];
		if user_id != global.steamID{
			steam_net_packet_send(int64(user_id), _buff, buffer_get_size(_buff), steam_net_packet_type_reliable);
		}
	}
	buffer_delete(_buff);
	show_debug_message("Send request to all: "+string(_request));
}
}
}