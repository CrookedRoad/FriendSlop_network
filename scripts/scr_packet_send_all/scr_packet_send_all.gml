///@function scr_packet_send_all(buffer, packetType, ignoreSelf)
function scr_packet_send_all(argument0, argument1, argument2){
var sendBuff = argument0;
var packType = argument1;
var ignoreSelf = argument2;
	if ds_exists(global.mp_lobby_playersList, ds_type_list){
	var playerListSize = ds_list_size(global.mp_lobby_playersList);
	var packetSize = buffer_tell(sendBuff);
		if (ignoreSelf){
			for(var i=0; i<playerListSize; i++)
			{
			var user_id = global.mp_lobby_playersList[| i];
				if user_id != global.steamID{
					steam_net_packet_send(int64(user_id), sendBuff, packetSize, packType);
				}
			}
		} else{
			for(var i=0; i<playerListSize; i++)
			{
			var user_id = global.mp_lobby_playersList[| i];
				steam_net_packet_send(int64(user_id), sendBuff, packetSize, packType);
			}
		}
		
		return(1);
	}
	
return(0);
}