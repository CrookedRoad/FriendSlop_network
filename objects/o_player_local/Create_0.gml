event_inherited();
scr_char_physics_init();

if instance_exists(o_viewController){
	o_viewController.viewFollowTarget = id;
} else{
	instance_create_depth(0, 0, 0, o_viewController);
}