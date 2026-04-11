///@function scr_steam_hostRequest(userID, requestName)
function scr_steam_hostRequest(argument0, argument1){
var _user_id = argument0;
var _request = argument1;
if _user_id != 0{
var _buff = buffer_create(1, buffer_grow, 1);
	buffer_write(_buff, buffer_string, _request);
	steam_net_packet_send(int64(_user_id), _buff, buffer_get_size(_buff), 2);
	buffer_delete(_buff);
	
	show_debug_message("Send request to user: "+string(_user_id)+" request: "+string(_request));
}
}