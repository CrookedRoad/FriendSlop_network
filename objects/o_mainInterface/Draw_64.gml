if global.grabbingObject != 0{
if instance_exists(global.grabbingObject) && instance_exists(o_player_local){
var obj = global.grabbingObject;
	if (global.controlsData[? "mouse_r"].hld){
	var pX, pY;
		pX = o_player_local.x;
		pY = o_player_local.y;
	var dir = point_direction(pX, pY, obj.x, obj.y);
	var distFactor = (point_distance(pX, pY, obj.x, obj.y)/global.grabDistLimit);
	var scale = 2;
	var alpha = 0.75;
	var xx, yy;
		xx = (scr_roomX_to_guiX(obj.x)/global.gui_scaling) + lengthdir_x(20, dir);
		yy = (scr_roomY_to_guiY(obj.y)/global.gui_scaling) + lengthdir_y(20, dir);
		repeat(5){
			scr_draw_sprite_to_gui(s_throwArrow, 0, xx, yy, scale, scale, dir, c_white, alpha);
			xx -= lengthdir_x(45*distFactor, dir);
			yy -= lengthdir_y(45*distFactor, dir);
			scale -= 0.2;
			alpha -= 0.1;
		}
	}
	
}
}