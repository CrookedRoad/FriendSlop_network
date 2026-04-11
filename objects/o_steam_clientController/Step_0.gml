/// @description Входящие пакеты от Steam
var _max_packets = 50;
while (steam_net_packet_receive() && _max_packets > 0) {
var sender_id = steam_net_packet_get_sender_id();
var _size = steam_net_packet_get_size();
var _buff = buffer_create(_size, buffer_fixed, 1);
	steam_net_packet_get_data(_buff);
	buffer_seek(_buff, buffer_seek_start, 0);
var _packet_type = buffer_read(_buff, buffer_u8);
	show_debug_message("Request received: "+string(_packet_type));
	_max_packets --;

	switch(_packet_type)
	{
		case packetType_client.ping: //Проверка пинга
			buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
			buffer_write(steam_sendBuffer, buffer_u8, packetType_host.pong);
	        steam_net_packet_send(int64(sender_id), steam_sendBuffer, buffer_tell(steam_sendBuffer), steam_net_packet_type_reliable);
		break;
		case packetType_client.pong: //Ответ на пинг
			show_debug_message("ping pong from: "+string(sender_id));
		break;
		
		case packetType_client.playerInit: //Запрос о инициализации игроков
		var count = buffer_read(_buff, buffer_u8);
			for(var i=0; i<count; i++){
			var user_id = buffer_read(_buff, buffer_u64);
				if ds_exists(global.mp_lobby_playersList, ds_type_list){ //Добавляем игрока в список
					ds_list_add(global.mp_lobby_playersList, user_id);
				}
				if user_id != global.steamID{
				var _x = buffer_read(_buff, buffer_s16);
				var _y = buffer_read(_buff, buffer_s16);
				var inst = instance_create_depth(_x, _y, 0, o_player_remote);
					inst.ownerSteam_id = user_id;
				}
			}
		break;
		case packetType_host.playerSync: //Синхронизация персонажей
		var pX = buffer_read(_buff, buffer_s16);
		var pY = buffer_read(_buff, buffer_s16);
			with(o_player_remote){
				if ownerSteam_id == sender_id{
					x = pX;
					y = pY;
				}
			}
		break;
	}
	
buffer_delete(_buff);
}