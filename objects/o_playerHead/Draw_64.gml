if !grab{
if bodyID != 0 && instance_exists(bodyID){
	if bodyID == o_player_local.id{
	var xx, yy, offset;
		xx = (scr_roomX_to_guiX(x)/global.gui_scaling);
		yy = (scr_roomY_to_guiY(y-20)/global.gui_scaling);
		offset = sin(current_time/200) * 4;
		scr_draw_sprite_to_gui(s_pointerArrow, 0, xx, yy+offset, 2, 2, 0, c_white, 1);
	}
}
}