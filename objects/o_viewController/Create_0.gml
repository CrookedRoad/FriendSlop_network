depth = -5000;

viewFollowTarget = o_player_local;

viewBoard = false;
viewBoardAlpha = 0;

view_index = 0;
viewXpos = room_width/2;
viewYpos = room_height/2;
viewFollowSpeed = 0.05;

viewShake_slowdown = 0.05;
viewShake = 0;
viewSh_x = 0;
viewSh_y = 0;
viewYoffset = 0;

if instance_exists(o_player_local){
	viewXpos = o_player_local.x;
	viewYpos = o_player_local.y-viewYoffset;
}

var viewBorder_w, viewBorder_h;
	viewBorder_w = ((global.view_width_basic/global.view_zoom)/2);
	viewBorder_h = ((global.view_height_basic/global.view_zoom)/2);
	view_x = viewXpos-((global.view_width_basic/global.view_zoom)/2);
	view_y = viewYpos-((global.view_height_basic/global.view_zoom)/2);
var camera = camera_create_view(viewXpos, viewYpos, (global.view_width_basic/global.view_zoom), (global.view_height_basic/global.view_zoom), 0, -1, -1, -1, viewBorder_w, viewBorder_h);
				
view_camera[view_index] = camera;
view_visible[view_index] = true;
view_enabled = true;