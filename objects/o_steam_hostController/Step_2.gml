/// @description Отправка локальных данных клиентам
if sendData_timer > 0 then sendData_timer -- else{
if ds_exists(global.mp_lobby_playersList, ds_type_list){
var playerListSize = ds_list_size(global.mp_lobby_playersList);
if playerListSize > 1{
	if instance_exists(o_player_local){ //Данные персонажа
	var playerData = {posX : 0, posY : 0, userID : 0};
		with(o_player_local){
			playerData.userID = ownerSteam_id;
			playerData.posX = x;
			playerData.posY = y;
		}
		
		buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
		buffer_write(steam_sendBuffer, buffer_u8, packetType_client.playerSync);
		buffer_write(steam_sendBuffer, buffer_u64, playerData.userID);
		buffer_write(steam_sendBuffer, buffer_s16, playerData.posX);
		buffer_write(steam_sendBuffer, buffer_s16, playerData.posY);
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