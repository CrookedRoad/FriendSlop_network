///@function scr_soundLoop_controlDist(x,y,vol)
function scr_soundLoop_controlDist(argument0, argument1, argument2){ //В объекте важно указать sound = 0 и vol = 0
var _x, _y;
	_x = argument0;
	_y = argument1;
var mainVol = argument2;
	if sound != 0 && audio_is_playing(sound){
	var dist = point_distance(x, y, _x, _y);
		dist = clamp(dist, 0, 100);
		vol = 1-(dist/100);
		audio_sound_gain(sound, mainVol*vol, 0);
	}
}