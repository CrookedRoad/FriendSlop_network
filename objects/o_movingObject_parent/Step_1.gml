if (canGrab){
	if !grab{
		if (global.controlsData[? "mouse_l"].prs){
		if global.cursor_on_object == id{
			if instance_exists(o_player_local){
			var dist = point_distance(x, y, o_player_local.x, o_player_local.y);
			var collisionLine = collision_line(x, y, o_player_local.x, o_player_local.y, o_wall, false, true) ||
								collision_line(x, y, o_player_local.x, o_player_local.y, o_physics_parent, false, true);
								
				if !collisionLine && dist < 100{
					grab = true;
					physics_set_density(fixture, 0.1);
				}
			}
		}
		}
	} else{
	var drop = false;
		phy_position_x = lerp(phy_position_x, global.mouseX, lerpSpeed);
		phy_position_y = lerp(phy_position_y, global.mouseY, lerpSpeed);
		phy_speed_x = 0;
		phy_speed_y = 0;
		if point_distance(phy_position_x, phy_position_y, global.mouseX, global.mouseY) > 32 then drop = true;
		if (global.controlsData[? "mouse_l"].rls) then drop = true;
		if instance_exists(o_player_local){
		var dist = point_distance(x, y, o_player_local.x, o_player_local.y);
			if dist > 100 then drop = true;
		} else drop = true;
		if (drop){
			grab = false;
			physics_set_density(fixture, densityDefault);
		}
	}
}