if instance_exists(o_roomController){
	scr_steam_request(global.mp_lobby_host_id, packetType.getPlayers);
	scr_steam_request(global.mp_lobby_host_id, packetType.getEntities);
}