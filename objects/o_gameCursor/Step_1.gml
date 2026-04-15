x = global.mouseX;
y = global.mouseY;
global.cursor_on_object = 0;
if instance_exists(o_physics_parent){
var collision = collision_point(x, y, o_physics_parent, false, true);
	if collision != noone then global.cursor_on_object = collision;
}

if instance_exists(o_player_local){
with(o_player_local){
	if keyboard_check_pressed(ord("E")){
		if rope == -1{
			if global.cursor_on_object != 0 && instance_exists(global.cursor_on_object){
				rope = instance_create_depth(x, y, depth, o_rope);
				rope.parent_obj = id;
				rope.target_obj = global.cursor_on_object;
				with(rope){event_user(0)}
			}
		} else{
			if instance_exists(rope){
				with(rope){
					instance_destroy();
				}
				rope = -1;
			}
		}
	}
}
}