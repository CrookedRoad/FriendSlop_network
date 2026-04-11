/// @function scr_cursor_in_circle(x,y,rad)
function scr_cursor_in_circle(argument0, argument1, argument2){
var _x, _y, _rad;
    _x = argument0*global.gui_scaling;
    _y = argument1*global.gui_scaling;
    _rad = argument2*global.gui_scaling;
	
	if point_in_circle(global.gui_mouseX, global.gui_mouseY, _x, _y, _rad){
	    return true;
	}

	return false;
}