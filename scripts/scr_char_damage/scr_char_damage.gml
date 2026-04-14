///@function scr_char_damage()
function scr_char_damage(){
if instance_exists(o_physics_parent){ //Урон от объектов
var collisionX, collisionY;
	collisionX = phy_position_x+lengthdir_x(16, 90);
	collisionY = phy_position_y+lengthdir_y(16, 90);
var collision = collision_point(collisionX, collisionY, o_physics_parent, true, false);
	if collision != noone{
	if collision.phy_speed_y > 0.3{
	var impact_speed = collision.phy_speed;
	var impact_force = collision.phy_mass * impact_speed;
	    if impact_force > 30{
		    show_debug_message("Получил по голове объектом " + object_get_name(collision.object_index));
		    show_debug_message("Сила удара: " + string(impact_force));
			HP -= 10;
			HP = clamp(HP, 0, maxhp);
			event_user(0);
	    } else{
			if impact_force > 15{
			    show_debug_message("Получил по голове объектом " + object_get_name(collision.object_index));
			    show_debug_message("Сила удара: " + string(impact_force));
				if instance_exists(o_steam_networkController){
					scr_steam_request(global.mp_lobby_host_id, packetType.playerSeparateHead_request);
				} else{
					scr_char_separate_head();
				}
				with(collision){
					physics_apply_impulse(x, y, choose(-5, 5), -10);
				}
			}
		}
	}
	}
}
if instance_exists(o_wall){ //Урон от удара головой о стену
var collisionX, collisionY;
	collisionX = phy_position_x+lengthdir_x(18, 90+image_alpha);
	collisionY = phy_position_y+lengthdir_y(18, 90+image_alpha);
var collision = collision_point(collisionX, collisionY, o_wall, true, false);
	if collision != noone{
	var impact_force = abs(phy_speed);
		if impact_force > 3{
			if instance_exists(o_steam_networkController){
				scr_steam_request(global.mp_lobby_host_id, packetType.playerSeparateHead_request);
			} else{
				scr_char_separate_head();
			}
		}
	}
}
}