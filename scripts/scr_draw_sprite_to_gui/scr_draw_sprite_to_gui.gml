/// @function scr_draw_sprite_to_gui(sprite,subimg,x,y,xscale,yscale,angle,color,alpha)
function scr_draw_sprite_to_gui(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8){
var _sprite, _subimg, _x, _y, _xscale, _yscale, _angle, _color, _alpha;
    _sprite = argument0;
    _subimg = argument1;
    _x = argument2*global.gui_scaling;
    _y = argument3*global.gui_scaling;
    _xscale = argument4*global.gui_scaling;
    _yscale = argument5*global.gui_scaling;
    _angle = argument6;
    _color = argument7;
    _alpha = argument8;
	
    draw_sprite_ext(_sprite, _subimg, _x, _y, _xscale, _yscale, _angle, _color, _alpha);
}