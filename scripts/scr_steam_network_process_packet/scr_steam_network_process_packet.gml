function scr_steam_network_process_packet(){
var sender_id = steam_net_packet_get_sender_id();
var _size = steam_net_packet_get_size();
var _buff = buffer_create(_size, buffer_fixed, 1);
	steam_net_packet_get_data(_buff);
	buffer_seek(_buff, buffer_seek_start, 0);
var _packet_type = buffer_read(_buff, buffer_u8);
	//show_debug_message("Request received: "+string(_packet_type));
	
	switch(_packet_type)
	{
		case packetType.ping: //Проверка пинга
			buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
			buffer_write(steam_sendBuffer, buffer_u8, packetType.pong);
	        steam_net_packet_send(int64(sender_id), steam_sendBuffer, buffer_tell(steam_sendBuffer), steam_net_packet_type_reliable);
		break;
		case packetType.pong: //Ответ на пинг
			show_debug_message("ping pong from: "+string(sender_id));
		break;
		
		case packetType.getPlayers: //Отправка данных о всех игроках (host only)
			buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
			buffer_write(steam_sendBuffer, buffer_u8, packetType.playersInit);
			var count = 0;
				with(o_player){
					if ownerSteam_id != 0 then count ++;
				}
				buffer_write(steam_sendBuffer, buffer_u8, count);
				with(o_player){
					if ownerSteam_id != 0{
					buffer_write(other.steam_sendBuffer, buffer_u64, ownerSteam_id);
					buffer_write(other.steam_sendBuffer, buffer_s16, x);
					buffer_write(other.steam_sendBuffer, buffer_s16, y);
					buffer_write(other.steam_sendBuffer, buffer_s8, image_xscale);
					}
				}
			steam_net_packet_send(int64(sender_id), steam_sendBuffer, buffer_tell(steam_sendBuffer), steam_net_packet_type_reliable);
		break;
		case packetType.playersInit: //Инициализация всех игроков (client only)
		var count = buffer_read(_buff, buffer_u8);
			for(var i=0; i<count; i++){
			var user_id = buffer_read(_buff, buffer_u64);
				if ds_exists(global.mp_lobby_playersList, ds_type_list){ //Добавляем игрока в список
					ds_list_add(global.mp_lobby_playersList, user_id);
				}
				if user_id != global.steamID{
				var _x = buffer_read(_buff, buffer_s16);
				var _y = buffer_read(_buff, buffer_s16);
				var _xscale = buffer_read(_buff, buffer_s8);
				var inst = instance_create_depth(_x, _y, 0, o_player_remote);
					inst.ownerSteam_id = user_id;
					inst.image_xscale = _xscale;
				}
			}
		break;
		case packetType.playerSync: //Синхронизация персонажей
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
					posX_target = pX;
					posY_target = pY;
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
		case packetType.playerDeath: //Смерть персонажа
			with(o_player_remote){
				if ownerSteam_id == sender_id{
					HP = 0;
					event_user(0);
				}
			}
		break;
		case packetType.playerSeparateHead_request: //Запрос хосту на потерю головы (host only)
		var user_id = sender_id;
			buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
			buffer_write(steam_sendBuffer, buffer_u8, packetType.playerSeparateHead);
			buffer_write(steam_sendBuffer, buffer_u64, user_id);
			buffer_write(steam_sendBuffer, buffer_u16, global.net_id_counter);
			scr_packet_send_all(steam_sendBuffer, steam_net_packet_type_reliable, false);
		break;
		case packetType.playerSeparateHead: //Потеря головы персонажа
		var user_id, newEntity;
			user_id = buffer_read(_buff, buffer_u64);
			newEntity = buffer_read(_buff, buffer_u16);
			with(o_player){
				if ownerSteam_id == user_id{
				var sepHead = scr_char_separate_head();
					scr_newEntity_add(sepHead);
				}
			}
		break;
		case packetType.playerAttachHead_request: //Запрос на прикрепление головы персонажа (host only)
		var user_id = sender_id;
		var obj_id = buffer_read(_buff, buffer_u16);
			buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
			buffer_write(steam_sendBuffer, buffer_u8, packetType.playerAttachHead);
			buffer_write(steam_sendBuffer, buffer_u64, user_id);
			buffer_write(steam_sendBuffer, buffer_u16, obj_id);
			scr_packet_send_all(steam_sendBuffer, steam_net_packet_type_reliable, false);
		break;
		case packetType.playerAttachHead: //Прикрепление головы персонажа
		var user_id = buffer_read(_buff, buffer_u64);
		var obj_id = buffer_read(_buff, buffer_u16);
		var obj = global.net_entities[? obj_id];
			if instance_exists(obj){
				with(o_player){
					if ownerSteam_id == user_id{
						headSprite = obj.sprite_index;
						bodySpring = 4;
						bodySpring_draw = bodySpring;
						if object_index == o_player_local{
							scr_viewFollowTarg_set_perm(id);
							if instance_exists(o_playerHead){
								with(o_playerHead){
									if bodyID == other.id then bodyID = 0;
								}
							}
						}
					}
				}
				with(obj){
					instance_destroy();
				}
			}
		break;
		case packetType.entitySync: //Синхронизация объектов
		var mySteamID = global.steamID;
		var count = buffer_read(_buff, buffer_u16);
			repeat(count)
			{
			var oID, oX, oY, oR;
				oID = buffer_read(_buff, buffer_u16);
				oX = buffer_read(_buff, buffer_s16);
				oY = buffer_read(_buff, buffer_s16);
				oR = buffer_read(_buff, buffer_s16);
			
			var obj = global.net_entities[? obj_id];
				if instance_exists(obj){
					if obj.ownerSteam_id != mySteamID{
						obj.phy_position_x = oX;
						obj.phy_position_y = oY;
						obj.phy_rotation = oR;
						obj.phy_active = true;
					}
				}
			}
		break;
		case packetType.requestOwnership: //Запрос от клиента на владение объектом (host only)
		var user_id = sender_id;
		var obj_id = buffer_read(_buff, buffer_u16);
		var obj = global.net_entities[? obj_id];
			if instance_exists(obj){
				obj.ownerSteam_id = user_id;
				
				buffer_seek(steam_sendBuffer, buffer_seek_start, 0);
				buffer_write(steam_sendBuffer, buffer_u8, packetType.informOwnership);
				buffer_write(steam_sendBuffer, buffer_u64, user_id);
				buffer_write(steam_sendBuffer, buffer_u16, obj_id);
				scr_packet_send_all(steam_sendBuffer, steam_net_packet_type_reliable, true);
			}
		break;
		case packetType.informOwnership: //Обновление прав владения объектом (client only)
		var user_id = sender_id;
		var obj_id = buffer_read(_buff, buffer_u16);
		var obj = global.net_entities[? obj_id];
			if instance_exists(obj){
				obj.ownerSteam_id = user_id;
			}
		break;
	}
	
buffer_delete(_buff);
}