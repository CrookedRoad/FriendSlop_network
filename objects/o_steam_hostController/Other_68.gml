/// @description Входящие пакеты от Steam
while (steam_net_packet_receive()) {
var sender_id = steam_net_packet_get_sender_id();
var _buff = steam_net_packet_get_data();
var _packet_type = buffer_read(_buff, buffer_string);
	switch(_packet_type)
	{
		case "ping": //Проверка пинга
		var res_buf = buffer_create(1, buffer_grow, 1);
			buffer_write(res_buf, buffer_string, "pong");
	        steam_net_packet_send(sender_id, res_buf, buffer_tell(res_buf), 2);
	        buffer_delete(res_buf);
		break;
		case "pong": //Ответ на пинг
			show_debug_message("ping pong from: "+string(sender_id));
		break;
		
		case "getPlayers": //Запрос о инициализации игроков
		var res_buf = buffer_create(1, buffer_grow, 1);
			buffer_write(res_buf, buffer_string, "playerInit");
			buffer_write(res_buf, buffer_u8, instance_number(o_player));
			if instance_exists(o_player){
				with(o_player){
					buffer_write(res_buf, buffer_u64, ownerSteam_id);
					buffer_write(res_buf, buffer_f32, x);
					buffer_write(res_buf, buffer_f32, y);
				}
			}
	        steam_net_packet_send(sender_id, res_buf, buffer_tell(res_buf), 2);
	        buffer_delete(res_buf);
		break;
	}
	
show_debug_message("Request received: "+string(_packet_type));
}