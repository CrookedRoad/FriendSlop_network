moving = false;
running = false;
climbing = false;
pushing = false;
armDirection = 0;
	
phy_speed_x = clamp(phy_speed_x, -current_max_speed, current_max_speed);
if point_distance(x, 0, posX_prev, 0) > 2{
	if x > posX_prev then image_xscale = 1 else image_xscale = -1;
	posX_prev = x;
	posY_prev = y;
}

if !moving{
	armAngle = lerp(armAngle, 20*image_xscale, 0.2);
	legAngle = lerp(legAngle, 0, 0.2);
	legOffset = lerp(legOffset, 0, 0.2);
	bodyOffset = 0;
	bodyAngle = 0;
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
	phy_rotation += 2*image_xscale;
}
if phy_speed_y > 8{
	if place_meeting(x, y+15, o_wall) || place_meeting(x, y+15, o_physics_parent){
		HP = 0;
		event_user(0);
	}
}