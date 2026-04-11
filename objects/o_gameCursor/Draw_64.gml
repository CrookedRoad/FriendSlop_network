if cursorText_string != ""{
if cursorText_alpha < 1 then cursorText_alpha += 0.1;
draw_set_font(cursorText_font);
var xx, yy, w, h, scale;
	xx = global.gui_mouseX+20;
	yy = global.gui_mouseY+22;
	scale = cursorText_scale*global.text_scaling*global.gui_scaling;
	w = (string_width(cursorText_string)*scale);
	h = (string_height(cursorText_string)*scale);
	
	xx = clamp(xx, 10, global.gui_width-(w+20));
	yy = clamp(yy, 10, global.gui_height-(h+10));
	
	draw_sprite_ext(s_custom_rectangle, 0, xx-(6*global.gui_scaling), yy-(4*global.gui_scaling), w+(12*global.gui_scaling), h+(10*global.gui_scaling), 0, cursorText_backcol, cursorText_alpha*0.7);
	draw_set_alpha(cursorText_alpha);
		draw_set_color(c_black);
		draw_text_transformed(xx+(1*global.gui_scaling), yy+(1*global.gui_scaling), string(cursorText_string), scale, scale, 0);
		draw_set_color(cursorText_color);
		draw_text_transformed(xx, yy, string(cursorText_string), scale, scale, 0);
	draw_set_alpha(1);
}