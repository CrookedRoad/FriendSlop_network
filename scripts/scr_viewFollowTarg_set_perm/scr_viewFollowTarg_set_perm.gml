///@function scr_viewFollowTarg_set_perm(obj)
function scr_viewFollowTarg_set_perm(argument0){
var _obj = argument0;
	if instance_exists(o_viewController) && instance_exists(_obj){
		o_viewController.viewFollowTarget = _obj;
	}
}