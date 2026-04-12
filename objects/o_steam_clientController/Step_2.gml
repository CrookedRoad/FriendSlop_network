/// @description Отправка локальных данных хосту
if sendData_timer > 0 then sendData_timer -- else{
var host_id = global.mp_lobby_host_id;
if instance_exists(o_player_local){ //Данные персонажа
var playerData = {posX : 0, posY : 0, userID : 0};
	with(o_player_local){
		playerData.userID = ownerSteam_id;
		playerData.posX = x;
		playerData.posY = y;
	}
	
	buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
	buffer_write(steam_sendBuffer, buffer_u8, packetType_host.playerSync);
	buffer_write(steam_sendBuffer, buffer_u64, playerData.userID);
	buffer_write(steam_sendBuffer, buffer_s16, playerData.posX);
	buffer_write(steam_sendBuffer, buffer_s16, playerData.posY);
	steam_net_packet_send(int64(host_id), steam_sendBuffer, buffer_tell(steam_sendBuffer), steam_net_packet_type_unreliable);
}
	

sendData_timer = tickrate;
}