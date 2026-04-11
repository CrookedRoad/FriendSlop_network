if viewBoardAlpha > 0.1{
var boardH = (50*global.gui_scaling)*viewBoardAlpha;
	draw_sprite_ext(s_custom_rectangle, 0, 0, 0, global.gui_width, boardH, 0, c_black, 1);
	draw_sprite_ext(s_custom_rectangle, 0, 0, global.gui_height, global.gui_width, -boardH, 0, c_black, 1);
}