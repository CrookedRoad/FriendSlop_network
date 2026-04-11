/// @function scr_draw_text_to_gui(x,y,string,scale,color,angle,alpha,halign,valign,outlite,font)
function scr_draw_text_to_gui(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10){
var t_x, t_y, t_string, t_scale, t_angle, t_alpha, t_halign, t_valign, t_outline, t_color, t_font;
    t_x = argument0*global.gui_scaling;
    t_y = argument1*global.gui_scaling;
    t_string = argument2;
    t_scale = (argument3*global.text_scaling)*global.gui_scaling;
    t_color = argument4;
    t_angle = argument5;
    t_alpha = argument6;
    t_halign = argument7;
    t_valign = argument8;
    t_outline = argument9;
	t_font = argument10;
	
	if t_font == -1 then draw_set_font(global.textData[? "defaultFont"]) else draw_set_font(t_font);
	draw_set_alpha(t_alpha);
	    if t_halign != -1 then draw_set_halign(t_halign);
	    if t_valign != -1 then draw_set_valign(t_valign);
	        if t_outline != -1{
	            draw_set_color(t_outline);
	            draw_text_transformed(t_x+(1*global.gui_scaling), t_y+(1*global.gui_scaling), string(t_string), t_scale, t_scale, t_angle);
	        }
	        draw_set_color(t_color);
	        draw_text_transformed(t_x, t_y, string(t_string), t_scale, t_scale, t_angle);
	    draw_set_halign(fa_left);
	    draw_set_valign(fa_top);
	draw_set_alpha(1);
}