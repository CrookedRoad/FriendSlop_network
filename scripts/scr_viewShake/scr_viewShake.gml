///@function scr_viewShake(power, slowdown)
function scr_viewShake(argument0, argument1){
var _power, _slowdown;
	_power = argument0;
	_slowdown = argument1;
	if instance_exists(o_viewController){
		o_viewController.viewShake = _power;
		if _slowdown != -1 then o_viewController.viewShake_slowdown = _slowdown;
	}
}