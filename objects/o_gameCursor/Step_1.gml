x = global.mouseX;
y = global.mouseY;
global.cursor_on_object = 0;
if instance_exists(o_physics_parent){
var collision = collision_point(x, y, o_physics_parent, false, true);
	if collision != noone then global.cursor_on_object = collision;
}