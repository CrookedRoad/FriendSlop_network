///@function scr_packet_send(userID, buffer, packetType)
function scr_packet_send(argument0, argument1, argument2){
var user_id = argument0;
var sendBuff = argument1;
var packType = argument2;
	if user_id != 0{
	var packetSize = buffer_tell(sendBuff);
		steam_net_packet_send(int64(user_id), sendBuff, packetSize, packType);
		return(1);
	}
	
return(0);
}