/// @description Входящие пакеты от Steam
var _max_packets = 50;
while (steam_net_packet_receive() && _max_packets > 0) {
	scr_steam_network_process_packet();
	_max_packets --;
}