///@function scr_viewFollowTarg_set(obj, backTimer)
function scr_viewFollowTarg_set(argument0, argument1){
var _obj, _timer;
	_obj = argument0;
	_timer = argument1;
	if instance_exists(o_viewController) && instance_exists(_obj){
		o_viewController.viewFollowTarget = _obj;
		if _timer != -1{
			with(o_viewController){
				alarm[0] = _timer;
			}
		}
	}
}