///@function scr_steam_clientRequest(hostID, requestName)
function scr_steam_clientRequest(argument0, argument1){
var _host_id = argument0;
var _request = argument1;
if _host_id != 0{
var _buff = buffer_create(1, buffer_grow, 1);
	buffer_write(_buff, buffer_u8, _request);
	steam_net_packet_send(int64(_host_id), _buff, buffer_get_size(_buff), steam_net_packet_type_reliable);
	buffer_delete(_buff);
	
	show_debug_message("Send request to host: "+string(_host_id)+" request: "+string(_request));
}
}