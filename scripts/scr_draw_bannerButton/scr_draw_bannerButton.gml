///@function scr_draw_bannerButton(x,y,width,string,alpha,interact, activate)
function scr_draw_bannerButton(argument0, argument1, argument2, argument3, argument4, argument5, argument6){
var _x, _y, _string, _alpha, _interact, _activate;
    _x = argument0*global.gui_scaling;
    _y = argument1*global.gui_scaling;
    _string = argument3;
    _alpha = argument4;
    _interact = argument5;
	_activate = argument6;

var b_scale = 1*global.gui_scaling;
var t_scale = (0.3*global.text_scaling)*global.gui_scaling;
var t_alpha = 1;
var t_color = c_dkgray;
var _buttonWidth, _buttonIndex, _buttonInteract, _buttonInteractAlpha;
    _buttonWidth = (argument2-20)*global.gui_scaling;
    if _buttonWidth == 0 then _buttonWidth = string_width(_string)*t_scale;
	
    _buttonIndex = 0;
    _buttonInteract = -1;
	_buttonInteractAlpha = 0.75;
    switch(_interact){
        case true:
        if point_in_rectangle(global.gui_mouseX, global.gui_mouseY, _x-(_buttonWidth/2), _y-(16*global.gui_scaling), _x+(_buttonWidth/2), _y+(16*global.gui_scaling)) || (_activate){
            t_alpha = 1;
			_buttonInteractAlpha = 1;
			_buttonInteract = 0;
            if (global.controlsData[? "confirm"].hld) || (global.controlsData[? "mouse_l"].hld){
                _buttonIndex = 1;
				_buttonWidth -= 10;
                t_alpha = 0.75;
				t_color = c_white;
            }
            if (global.controlsData[? "confirm"].rls) || (global.controlsData[? "mouse_l"].rls){
                _buttonInteract = 1;
            }
        }
        break;
    }
	
    draw_sprite_ext(s_bannerButton_loop, _buttonIndex, _x-(_buttonWidth/2), _y, _buttonWidth, b_scale, 0, c_white, _alpha*_buttonInteractAlpha);
    draw_sprite_ext(s_bannerButton_plug, _buttonIndex, _x-(_buttonWidth/2), _y, b_scale, b_scale, 0, c_white, _alpha*_buttonInteractAlpha);
    draw_sprite_ext(s_bannerButton_plug, _buttonIndex, _x+(_buttonWidth/2), _y, -b_scale, b_scale, 0, c_white, _alpha*_buttonInteractAlpha);
    draw_set_font(global.textData[? "mainFont"]);
    draw_set_alpha(_alpha*t_alpha);
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
            draw_set_color(t_color);
            draw_text_transformed(_x, _y, string(_string), t_scale, t_scale, 0);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    draw_set_alpha(1);
    
    return _buttonInteract;
}