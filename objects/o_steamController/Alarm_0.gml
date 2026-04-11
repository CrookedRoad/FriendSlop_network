scr_network_update();
var steamConnection = scr_steamConnection_check();
if (steamConnection){
	if !open_p2p_sessions{
		steam_net_set_auto_accept_p2p_sessions(true);
		steam_net_packet_receive();
		open_p2p_sessions = true;
	}
}

alarm[0] = global.timeSec_const;