/// @description Отправка локальных данных хосту
if sendData_timer > 0 then sendData_timer -- else{
var host_id = global.mp_lobby_host_id;
if instance_exists(o_player_local){ //Данные персонажа
var pX, pY, pSh, pSv, pR, pMoving, pRunning, pClimbing, pPushing;
	with(o_player_local){
		pX = phy_position_x;
		pY = phy_position_y;
		pSh = phy_speed_x;
		pSv = phy_speed_y;
		pR = phy_rotation;
		pMoving = moving;
		pRunning = running;
		pClimbing = climbing;
		pPushing = pushing;
	}
	
	buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
	buffer_write(steam_sendBuffer, buffer_u8, packetType_host.playerSync);
	buffer_write(steam_sendBuffer, buffer_s16, pX);
	buffer_write(steam_sendBuffer, buffer_s16, pY);
	buffer_write(steam_sendBuffer, buffer_s16, pSh);
	buffer_write(steam_sendBuffer, buffer_s16, pSv);
	buffer_write(steam_sendBuffer, buffer_s16, pR);
	var flags = 0;
		if (pMoving)   flags |= FLAG_MOVING;
		if (pRunning)  flags |= FLAG_RUNNING;
		if (pClimbing) flags |= FLAG_CLIMBING;
		if (pPushing)  flags |= FLAG_PUSHING;
	buffer_write(steam_sendBuffer, buffer_u8, flags);
	steam_net_packet_send(int64(host_id), steam_sendBuffer, buffer_tell(steam_sendBuffer), steam_net_packet_type_unreliable);
}
	

sendData_timer = tickrate;
}