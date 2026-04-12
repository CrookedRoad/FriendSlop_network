moving = false;
running = false;
climbing = false;
pushing = false;
armDirection = 0;

var _key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
var _key_left  = keyboard_check(vk_left)  || keyboard_check(ord("A"));
var _key_jump  = keyboard_check_pressed(vk_space);
var _key_run  = keyboard_check(vk_shift);
var _move_dir = _key_right - _key_left;

var _move_force = move_force;
var _target_move_speed = walk_speed;
var _on_ground = place_meeting(x, y+20, o_wall) || place_meeting(x, y+20, o_physics_parent);
	if (_move_dir != 0){
		if (_key_run && _on_ground){
			_target_move_speed = run_speed;
			_move_force *= 2;
			running = true;
		}
	
		if (_on_ground){
			current_max_speed = _target_move_speed;
			if image_xscale == _move_dir{
				if place_meeting(x+(10*image_xscale), y, o_physics_parent){
					pushing = true;
				}
			}
		} else{
			if place_meeting(x+(10*image_xscale), y+15, o_wall){
				climbing = true;
			}
		}
	    physics_apply_force(x, y, _move_dir * _move_force, 0);
		moving = true;
	} else{
		armAngle = lerp(armAngle, 20*image_xscale, 0.2);
		legAngle = lerp(legAngle, 0, 0.2);
		legOffset = lerp(legOffset, 0, 0.2);
		bodyOffset = 0;
		bodyAngle = 0;
		if (_on_ground){
			phy_speed_x = lerp(phy_speed_x, 0, 0.15);
		}
	}

	if (_key_jump && abs(phy_speed_y) < 0.3){
		if !place_meeting(x, y-20, o_wall){
			physics_apply_impulse(x, y, 0, jump_force);
		}
	}
	
phy_speed_x = clamp(phy_speed_x, -current_max_speed, current_max_speed);
if point_distance(x, 0, posX_prev, 0) > 2{
	if x > posX_prev then image_xscale = 1 else image_xscale = -1;
	posX_prev = x;
	posY_prev = y;
}

if (climbing){
	phy_speed_y = -2;
	armDirection = 90*image_xscale;
}
if (pushing){
	armDirection = 90*image_xscale;
}

if phy_speed_y > 3{
	bodySpring = 10;
	armAngle = lerp(armAngle, 90*image_xscale, 0.4);
} else{
	phy_rotation += sin(degtorad(0 - phy_rotation))*20;
}
if phy_speed_y > 5{
	bodySpring = 0;
	phy_rotation += 2*image_xscale;
}
if phy_speed_y > 8{
	if place_meeting(x, y+15, o_wall) || place_meeting(x, y+15, o_physics_parent){
		HP = 0;
		event_user(0);
	}
}