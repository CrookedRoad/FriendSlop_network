if (canGrab){
	if !grab{
		if (global.controlsData[? "mouse_l"].prs){
		if global.cursor_on_object == id{
			if instance_exists(o_player_local){
			var dist = point_distance(x, y, o_player_local.x, o_player_local.y);
			var collisionLine = collision_line(x, y, o_player_local.x, o_player_local.y, o_wall, false, true) ||
								collision_line(x, y, o_player_local.x, o_player_local.y, o_physics_parent, false, true);
								
				if !collisionLine && dist < global.grabDistLimit{
					grab = true;
					physics_set_density(fixture, 0.1);
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
		phy_position_x = lerp(phy_position_x, global.mouseX, lerpSpeed);
		phy_position_y = lerp(phy_position_y, global.mouseY, lerpSpeed);
		phy_speed_x = 0;
		phy_speed_y = 0;
		global.grabbingObject = id;
		if point_distance(phy_position_x, phy_position_y, global.mouseX, global.mouseY) > 32 then drop = true;
		if (global.controlsData[? "mouse_l"].rls) then drop = true;
		if instance_exists(o_player_local){
		var dist = point_distance(x, y, o_player_local.x, o_player_local.y);
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
			physics_set_density(fixture, densityDefault);
		}
	}
}