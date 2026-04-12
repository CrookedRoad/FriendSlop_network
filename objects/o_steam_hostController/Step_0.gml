/// @description Входящие пакеты от Steam
var _max_packets = 50;
while (steam_net_packet_receive() && _max_packets > 0) {
var sender_id = steam_net_packet_get_sender_id();
var _size = steam_net_packet_get_size();
var _buff = buffer_create(_size, buffer_fixed, 1);
	steam_net_packet_get_data(_buff);
	buffer_seek(_buff, buffer_seek_start, 0);
var _packet_type = buffer_read(_buff, buffer_u8);
	_max_packets --;
	//show_debug_message("Request received: "+string(_packet_type));
	
	switch(_packet_type)
	{
		case packetType_host.ping: //Проверка пинга
			buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
			buffer_write(steam_sendBuffer, buffer_u8, packetType_client.pong);
			
	        steam_net_packet_send(int64(sender_id), steam_sendBuffer, buffer_tell(steam_sendBuffer), steam_net_packet_type_reliable);
		break;
		case packetType_host.pong: //Ответ на пинг
			show_debug_message("ping pong from: "+string(sender_id));
		break;
		
		case packetType_host.getPlayers: //Запрос о инициализации игроков
			buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
			buffer_write(steam_sendBuffer, buffer_u8, packetType_client.playerInit);
			
			buffer_write(steam_sendBuffer, buffer_u8, instance_number(o_player));
			if instance_exists(o_player){
				with(o_player){
					buffer_write(other.steam_sendBuffer, buffer_u64, ownerSteam_id);
					buffer_write(other.steam_sendBuffer, buffer_s16, x);
					buffer_write(other.steam_sendBuffer, buffer_s16, y);
					buffer_write(other.steam_sendBuffer, buffer_s8, image_xscale);
				}
			}
			steam_net_packet_send(int64(sender_id), steam_sendBuffer, buffer_tell(steam_sendBuffer), steam_net_packet_type_reliable);
		break;
		case packetType_host.playerSync: //Синхронизация персонажей
		var pX, pY, pSh, pSv, pR, pXs, pMoving, pRunning, pClimbing, pPushing;
			pX = buffer_read(_buff, buffer_s16);
			pY = buffer_read(_buff, buffer_s16);
			pSh = buffer_read(_buff, buffer_s16);
			pSv = buffer_read(_buff, buffer_s16);
			pR = buffer_read(_buff, buffer_s16);
			pXs = buffer_read(_buff, buffer_s8);
		var flags = buffer_read(_buff, buffer_u8);
			pMoving   = (flags & FLAG_MOVING) != 0;
			pRunning  = (flags & FLAG_RUNNING) != 0;
			pClimbing = (flags & FLAG_CLIMBING) != 0;
			pPushing  = (flags & FLAG_PUSHING) != 0;
			with(o_player_remote){
				if ownerSteam_id == sender_id{
					phy_position_x = pX;
					phy_position_y = pY;
					speed_hor = pSh;
					speed_ver = pSv;
					rotation_target = pR;
					image_xscale = pXs;
					moving = pMoving;
					running = pRunning;
					climbing = pClimbing;
					pushing = pPushing;
					
					phy_speed_x = 0;
					phy_speed_y = 0;
				}
			}
		break;
	}
	
buffer_delete(_buff);
}