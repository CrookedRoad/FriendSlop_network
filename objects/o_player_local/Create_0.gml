event_inherited();

if instance_exists(o_viewController){
	o_viewController.viewFollowTarget = id;
} else{
	instance_create_depth(0, 0, 0, o_viewController);
}