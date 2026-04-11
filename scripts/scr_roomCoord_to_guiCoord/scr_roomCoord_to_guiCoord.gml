///@function scr_roomX_to_guiX(x)
function scr_roomX_to_guiX(argument0){
var _sf = (global.gui_width/global.cameraWidth);
var _x = (argument0 - global.cameraXpos) * _sf;
	return(_x);
}

///@function scr_roomY_to_guiY(y)
function scr_roomY_to_guiY(argument0){
var _sf = (global.gui_height/global.cameraHeight);
var _y = (argument0 - global.cameraYpos) * _sf;
	return(_y);
}