///@function scr_draw_cursor_text(string,color)
function scr_draw_cursor_text(argument0, argument1){
var _string = argument0;
var _color = argument1;
	if instance_exists(o_gameCursor){
		o_gameCursor.cursorText_string = _string;
		if _color != -1 then o_gameCursor.cursorText_color = _color;
	}
}

function scr_cursor_text_transparencySet(){
	if instance_exists(o_gameCursor){
		o_gameCursor.cursorText_alpha = 0;
	}
}