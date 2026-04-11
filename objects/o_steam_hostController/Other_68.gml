/// @description Входящие пакеты от Steam
while (steam_net_packet_receive()) {
var sender_id = steam_net_packet_get_sender_id();
var _size = steam_net_packet_get_size();
var _buff = buffer_create(_size, buffer_fixed, 1);
	steam_net_packet_get_data(_buff);
	buffer_seek(_buff, buffer_seek_start, 0);
var _packet_type = buffer_read(_buff, buffer_string);
	show_debug_message("Request received: "+string(_packet_type));
	
	switch(_packet_type)
	{
		case "ping": //Проверка пинга
		var res_buf = buffer_create(1, buffer_grow, 1);
			buffer_write(res_buf, buffer_string, "pong");
	        steam_net_packet_send(int64(sender_id), res_buf, buffer_get_size(res_buf), 2);
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
	        steam_net_packet_send(int64(sender_id), res_buf, buffer_get_size(res_buf), 2);
	        buffer_delete(res_buf);
		break;
		case "test":
			show_debug_message("Request received: test");
		break;
	}
	
buffer_delete(_buff);
}