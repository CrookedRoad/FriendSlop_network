if instance_exists(o_steam_networkController){
if network_id != -1{
	if ownerSteam_id != global.steamID{
	var _buff = buffer_create(1, buffer_grow, 1);
		buffer_write(_buff, buffer_u8, packetType.requestOwnership);
		buffer_write(_buff, buffer_u16, network_id);
		steam_net_packet_send(int64(global.mp_lobby_host_id), _buff, buffer_get_size(_buff), steam_net_packet_type_reliable);
		buffer_delete(_buff);
							
		ownerSteam_id = global.steamID;
	}
}
}