draw_sprite_ext(s_custom_rectangle, 0, 0, 0, global.gui_width, global.gui_height, 0, c_black, 0.5);
var xx, yy;
	xx = global.gui_width_basic/2;
	yy = global.gui_height_basic/2;
	scr_draw_sprite_to_gui(s_loading_ico, 0, xx+2, yy+2, 0.2, 0.2, -(current_time/5), c_black, 1);
	scr_draw_sprite_to_gui(s_loading_ico, 0, xx, yy, 0.2, 0.2, -(current_time/5), c_white, 1);