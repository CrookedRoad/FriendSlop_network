///@function scr_roomGoto(room, aSpeed, dSpeed, delay)
function scr_roomGoto(argument0, argument1, argument2, argument3){
var _room, _aSpd, _dSpd, _delay;
	_room = argument0;
	_aSpd = argument1;
	_dSpd = argument2;
	_delay = argument3;
	if !instance_exists(o_room_goto){
	var roomGoto = instance_create_depth(0, 0, 0, o_room_goto);
		if _room != -1 then roomGoto.ROOM = _room;
		if _aSpd != -1 then roomGoto.aSpeed = _aSpd;
		if _dSpd != -1 then roomGoto.dSpeed = _dSpd;
		if _delay != -1 then roomGoto.delay = _delay;
	}
}