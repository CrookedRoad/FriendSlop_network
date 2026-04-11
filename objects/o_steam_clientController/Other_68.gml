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
		
		case "playerInit": //Запрос о инициализации игроков
		var count = buffer_read(_buff, buffer_u8);
			for(var i=0; i<count; i++){
			var user_id = buffer_read(_buff, buffer_u64);
				if ds_exists(global.mp_lobby_playersList, ds_type_list){ //Добавляем игрока в список
					ds_list_add(global.mp_lobby_playersList, user_id);
				}
				if user_id != steam_get_user_steam_id(){
				var _x = buffer_read(_buff, buffer_f32);
				var _y = buffer_read(_buff, buffer_f32);
				var inst = instance_create_depth(_x, _y, 0, o_player_other);
					inst.ownerSteam_id = user_id;
				}
			}
		break;
	}
}