/// @description Отправка локальных данных клиентам
if sendData_timer > 0 then sendData_timer -- else{
if ds_exists(global.mp_lobby_playersList, ds_type_list){
var playerListSize = ds_list_size(global.mp_lobby_playersList);
if playerListSize > 1{
if instance_exists(o_player_local){ //Данные персонажа
var pX, pY, pSh, pSv, pR, pXs, pMoving, pRunning, pClimbing, pPushing;
	with(o_player_local){
		pX = phy_position_x;
		pY = phy_position_y;
		pSh = phy_speed_x;
		pSv = phy_speed_y;
		pR = phy_rotation;
		pXs = image_xscale;
		pMoving = moving;
		pRunning = running;
		pClimbing = climbing;
		pPushing = pushing;
	}
		
	buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
	buffer_write(steam_sendBuffer, buffer_u8, packetType_client.playerSync);
	buffer_write(steam_sendBuffer, buffer_s16, pX);
	buffer_write(steam_sendBuffer, buffer_s16, pY);
	buffer_write(steam_sendBuffer, buffer_s16, pSh);
	buffer_write(steam_sendBuffer, buffer_s16, pSv);
	buffer_write(steam_sendBuffer, buffer_s16, pR);
	buffer_write(steam_sendBuffer, buffer_s8, pXs);
	var flags = 0;
		if (pMoving)   flags |= FLAG_MOVING;
		if (pRunning)  flags |= FLAG_RUNNING;
		if (pClimbing) flags |= FLAG_CLIMBING;
		if (pPushing)  flags |= FLAG_PUSHING;
	buffer_write(steam_sendBuffer, buffer_u8, flags);
	var packetSize = buffer_tell(steam_sendBuffer);
	for(var i=0; i<playerListSize; i++)
	{
	var user_id = global.mp_lobby_playersList[| i];
		if user_id != global.steamID{
			steam_net_packet_send(int64(user_id), steam_sendBuffer, packetSize, steam_net_packet_type_unreliable);
		}
	}
}
	
	
}
}
sendData_timer = tickrate;
}