///@function scr_steam_request(userID, requestName)
function scr_steam_request(argument0, argument1){
var _user_id = argument0;
var _request = argument1;
if _user_id != 0{
var _buff = buffer_create(1, buffer_grow, 1);
	buffer_write(_buff, buffer_u8, _request);
	steam_net_packet_send(int64(_user_id), _buff, buffer_get_size(_buff), steam_net_packet_type_reliable);
	buffer_delete(_buff);
	
	show_debug_message("Send request to user: "+string(_user_id)+" request: "+string(_request));
}
}