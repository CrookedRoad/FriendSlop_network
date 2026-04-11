///@function scr_draw_customButton(x,y,sprite,subing,alpha,interact,rad)
function scr_draw_customButton(argument0, argument1, argument2, argument3, argument4, argument5, argument6){
var _x, _y, _sprite, _subimg, _alpha, _interact, _rad;
    _x = argument0*global.gui_scaling;
    _y = argument1*global.gui_scaling;
	_sprite = argument2;
	_subimg = argument3;
    _alpha = argument4;
    _interact = argument5;
	_rad = argument6;

var _scaling = 0.5*global.gui_scaling;
var _buttonIndex, _buttonInteract;
	
    _buttonIndex = 1;
    _buttonInteract = -1;
    switch(_interact){
        case true:
		if point_in_circle(global.gui_mouseX, global.gui_mouseY, _x, _y, _rad*_scaling){
            _buttonIndex = 1.1;
			_buttonInteract = 0;
			global.mapInteract = false;
			if (global.controlsData[? "mouse_l"].hld){
                _buttonIndex = 1;
            }
            if (global.controlsData[? "mouse_l"].rls){
                _buttonInteract = 1;
				scr_soundPlay(snd_menuButtonSelect, global.globVol*global.intVol, 0, 0, 0, -1);
            }
        }
        break;
    }
	
    draw_sprite_ext(_sprite, _subimg, _x, _y, _scaling*_buttonIndex, _scaling*_buttonIndex, 0, c_white, _alpha);
    
    return _buttonInteract;
}