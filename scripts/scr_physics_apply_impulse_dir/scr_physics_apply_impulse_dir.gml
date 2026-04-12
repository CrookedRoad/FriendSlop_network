///@function scr_physics_apply_impulse_dir(x, y, angle, force)
function scr_physics_apply_impulse_dir(argument0, argument1, argument2, argument3){
var _x, _y;
	_x = argument0;
	_y = argument1;
var _angle = argument2;
var _force = argument3;
var _fx, _fy;
	_fx = lengthdir_x(_force, _angle);
	_fy = lengthdir_y(_force, _angle);
	physics_apply_impulse(_x, _y, _fx, _fy);
}