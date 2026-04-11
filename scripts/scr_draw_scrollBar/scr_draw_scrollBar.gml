///@function scr_draw_scrollBar(x, y, width, alpha, value, minValue, maxValue, lockKey)
function scr_draw_scrollBar(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7){
var _x, _y, _width, _alpha, _scale;
	_x = argument0*global.gui_scaling;
	_y = argument1*global.gui_scaling;
	_width = argument2*global.gui_scaling;
	_alpha = argument3;
	_scale = 0.5*global.gui_scaling;
var _value, _minValue, _maxValue, _lockKey;
	_value = argument4;
	_minValue = argument5;
	_maxValue = argument6;
	_lockKey = argument7;
var _handleAlpha, _handleScale;
	_handleAlpha = 0.5;
	_handleScale = 1;
	
var _handleColor = c_white;
var _handleStep = (_width/(_maxValue-_minValue));
var _handleX;
	_handleX = _x-(_width/2) + ((_value-_minValue)*_handleStep);
	_handleX = clamp(_handleX, _x-(_width/2)+(6*global.gui_scaling), _x+(_width/2)-(6*global.gui_scaling));
	if point_in_rectangle(global.gui_mouseX, global.gui_mouseY, _handleX-(10*global.gui_scaling), _y-(10*global.gui_scaling), _handleX+(10*global.gui_scaling), _y+(10*global.gui_scaling)) || _lockKey == true{
		_handleAlpha = 1;
		_handleColor = global.colorData[? "intCol_3"];
	}
	switch(_lockKey)
	{
		case true:
		if (global.controlsData[? "mouse_l"].hld){
		var _dist = global.gui_mouseX-(_x-(_width/2));
			_dist = clamp(_dist, 0, _width);
			_value = (_dist/_handleStep)+_minValue;
			_handleScale = 0.85;
			_handleColor = global.colorData[? "intCol_5"];
			if argument4 != round(_value) && !audio_is_playing(snd_scrollBar){
				scr_soundPlay(snd_scrollBar, (global.globVol*global.intVol)*0.5, 0, 0, 0, -1);
			}
		}
		break;
	}
	
	draw_sprite_ext(s_scrollBar_end, 0, _x-(_width/2), _y, _scale, _scale, 0, c_white, _alpha);
	draw_sprite_ext(s_scrollBar_end, 0, _x+(_width/2), _y, -_scale, _scale, 0, c_white, _alpha);
	draw_sprite_ext(s_scrollBar_loop, 1, _x-(_width/2), _y, _handleX-(_x-(_width/2)), _scale, 0, _handleColor, _alpha*0.5);
	draw_sprite_ext(s_scrollBar_loop, 0, _x-(_width/2), _y, _width, _scale, 0, c_white, _alpha);
	draw_sprite_ext(s_scrollBar_handle, 0, _handleX, _y, 3*_scale*_handleScale, 3*_scale*_handleScale, 0, _handleColor, _alpha);
	
	return(round(_value));
}