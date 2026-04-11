///@function scr_create_partEmitter(x, y, depth, time)
function scr_create_partEmitter(argument0, argument1, argument2, argument3){
var _x, _y, _depth, _time;
	_x = argument0;
	_y = argument1;
	_depth = argument2;
	_time = argument3;

var _emitter = 0;
	_emitter = instance_create_depth(_x, _y, _depth, o_particle_emitter);
	_emitter.timer = _time;
	return(_emitter);
}