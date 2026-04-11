/// @function scr_cursor_in_rectangle(x1,y1,x2,y2)
function scr_cursor_in_rectangle(argument0, argument1, argument2, argument3){
var _x1, _y1, _x2, _y2;
    _x1 = argument0*global.gui_scaling;
    _y1 = argument1*global.gui_scaling;
    _x2 = argument2*global.gui_scaling;
    _y2 = argument3*global.gui_scaling;
	
	if point_in_rectangle(global.gui_mouseX, global.gui_mouseY, _x1, _y1, _x2, _y2){
	    return true;
	}

	return false;
}