///@function scr_entityDestroy_request(netID)
function scr_entityDestroy_request(argument0){
var _netID = argument0;
var _obj = global.net_entities[? _netID];
	if instance_exists(_obj){
	var _buff = buffer_create(1, buffer_grow, 1);
		buffer_write(_buff, buffer_u8, packetType.entityDestroy_request);
		buffer_write(_buff, buffer_u16, _netID);
		steam_net_packet_send(int64(global.mp_lobby_host_id), _buff, buffer_get_size(_buff), steam_net_packet_type_reliable);
		buffer_delete(_buff);
	}
}