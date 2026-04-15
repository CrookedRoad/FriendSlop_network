var networkEnabled = instance_exists(o_steam_networkController);
if (networkEnabled){
if (physics_init) && network_id != -1{
var isLocalOwner = (ownerSteam_id == global.steamID);
	if !isLocalOwner{
		phy_position_x = lerp(phy_position_x, posX_target, lerpSpeed);
		phy_position_y = lerp(phy_position_y, posY_target, lerpSpeed);
		phy_rotation = lerp(phy_rotation, rotation_target, lerpSpeed);
	    phy_linear_velocity_x = 0;
	    phy_linear_velocity_y = 0;
	    phy_angular_velocity = 0;
	}
}
}

if (canGrab){
	if !grab{
		if (global.controlsData[? "mouse_l"].prs){
		if !grabbing{
			if global.cursor_on_object == id{
				if instance_exists(o_player_local){
				var dist = point_distance(x, y, o_player_local.x, o_player_local.y);
				var collisionLine = collision_line(x, y, o_player_local.x, o_player_local.y, o_wall, false, true) ||
									collision_line(x, y, o_player_local.x, o_player_local.y, o_physics_parent, false, true);
								
					if !collisionLine && dist < global.grabDistLimit{
						if (networkEnabled){
							if ownerSteam_id != global.steamID{
							var _buff = buffer_create(1, buffer_grow, 1);
								buffer_write(_buff, buffer_u8, packetType.requestOwnership);
								buffer_write(_buff, buffer_u16, network_id);
								steam_net_packet_send(int64(global.mp_lobby_host_id), _buff, buffer_get_size(_buff), steam_net_packet_type_reliable);
								buffer_delete(_buff);
							
								ownerSteam_id = global.steamID;
							}
						}
					
						grab = true;
						grabbing = true;
						physics_set_density(fixture, 0.1);
					}
				}
			}
		}
		}
	} else{
	var throwing = false;
	var drop = false;
	var xPrev, yPrev;
		xPrev = phy_position_x;
		yPrev = phy_position_y;
		phy_position_x = lerp(phy_position_x, global.mouseX, grabbingLerpSpeed);
		phy_position_y = lerp(phy_position_y, global.mouseY, grabbingLerpSpeed);
		phy_speed_x = 0;
		phy_speed_y = 0;
		global.grabbingObject = id;
		if point_distance(phy_position_x, phy_position_y, global.mouseX, global.mouseY) > 32 then drop = true;
		if (global.controlsData[? "mouse_l"].rls) then drop = true;
		if instance_exists(o_player_local){
		var dist = point_distance(x, y, o_player_local.x, o_player_local.y);
			with(o_player_local){
				if !moving{
					if other.x > x then image_xscale = 1 else image_xscale = -1;
				}
			}
			if dist > global.grabDistLimit then drop = true;
			if (global.controlsData[? "mouse_r"].rls){
			var dir = point_direction(o_player_local.x, o_player_local.y, x, y);
				scr_physics_apply_impulse_dir(x, y, dir, 1);
				drop = true;
				throwing = true;
			}
		} else drop = true;
		if (drop){
			if !throwing{
			var dir = point_direction(xPrev, yPrev, global.mouseX, global.mouseY);
			var deltaDist = point_distance(global.mouseX, global.mouseY, xPrev, yPrev);
				scr_physics_apply_impulse_dir(x, y, dir, deltaDist*0.025);
			}
			grab = false;
			grabbing = false;
			physics_set_density(fixture, densityDefault);
		}
	}
}