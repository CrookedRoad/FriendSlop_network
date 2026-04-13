event_inherited();
if instance_exists(o_player){
with(o_player){
var collisionX, collisionY;
	collisionX = phy_position_x+lengthdir_x(18, 90+image_alpha);
	collisionY = phy_position_y+lengthdir_y(18, 90+image_alpha);
var collision = collision_point(collisionX, collisionY, other.object_index, true, false);
	if collision != noone{
	with(collision){
		if delay <= 0{
		if other.headSprite == 0{
			if instance_exists(o_steam_networkController){
			var _buff = buffer_create(1, buffer_grow, 1);
				buffer_write(_buff, buffer_u8, packetType.playerAttachHead_request);
				buffer_write(_buff, buffer_u16, network_id);
				steam_net_packet_send(int64(global.mp_lobby_host_id), _buff, buffer_get_size(_buff), steam_net_packet_type_reliable);
				buffer_delete(_buff);
				
				delay = 120;
			} else{
				instance_destroy();
				with(other){
					headSprite = other.sprite_index;
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
		}
		}
	}
	}
}
}