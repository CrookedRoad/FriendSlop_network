///@function scr_soundPlay(sound, volume, priority, loop, gainTime, checkPlaying)
function scr_soundPlay(argument0, argument1, argument2, argument3, argument4, argument5){
var _sound, _volume, _priority, _loop, _gainTime, _check;
	_sound = argument0;
	_volume = argument1;
	_priority = argument2;
	_loop = argument3;
	_gainTime = argument4;
	_check = argument5;
	
var checkPlaying = true;
	if _check != -1{
	    switch(_check){
	        case true:
	            if !audio_is_playing(_sound) then checkPlaying = false;
	        break;
	        case false:
	            if audio_is_playing(_sound) then checkPlaying = false;
	        break;
	    }
	}
	
var _soundHandle = -1;
	if (checkPlaying){
	    _soundHandle = audio_play_sound(_sound, _priority, _loop);
	    audio_sound_gain(_soundHandle, _volume, _gainTime);
	}
	return(_soundHandle);
}