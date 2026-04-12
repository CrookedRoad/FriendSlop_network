function scr_char_separate_head(){
if headSprite != 0{
var headX, headY;
	headX = posX+lengthdir_x(10, 90+image_angle);
	headY = posY+lengthdir_y(10, 90+image_angle);
var head = instance_create_depth(headX, headY, depth, o_playerHead);
	with(head){
		bodyID = other.id;
		ownerSteam_id = other.ownerSteam_id;
		sprite_index = other.headSprite;
		phy_rotation = other.phy_rotation;
		image_xscale = other.image_xscale;
		scr_physics_apply_impulse_dir(x, y, image_angle+(90+irandom_range(-30,30)), irandom_range(30, 50));
	}
	
headSprite = 0;
if object_index == o_player_local{
	scr_viewFollowTarg_set_perm(head);
}
}
}