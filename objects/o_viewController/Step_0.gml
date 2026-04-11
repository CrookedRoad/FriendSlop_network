///Управление видом
if viewShake > 0{viewSh_x = irandom_range(-viewShake, viewShake); viewSh_y = irandom_range(-viewShake, viewShake); viewShake -= viewShake_slowdown;} 
switch(global.viewMoveBlock){
    case false:
	if instance_exists(viewFollowTarget){
		if viewFollowTarget == o_player_local{
			viewXpos = viewFollowTarget.posX;
			viewYpos = viewFollowTarget.posY-viewYoffset;
		} else{
			viewXpos = viewFollowTarget.x;
			viewYpos = viewFollowTarget.y-viewYoffset;
		}
	}
    break;
}
switch(global.cameraZoom)
{
	case true:
		global.view_zoom = lerp(global.view_zoom, 1.5, 0.05);
	break;
	case false:
		global.view_zoom = lerp(global.view_zoom, 1, 0.05);
	break;
}

var viewBorder_w, viewBorder_h;
	viewBorder_w = ((global.view_width_basic/global.view_zoom)/2);
	viewBorder_h = ((global.view_height_basic/global.view_zoom)/2);
	viewXpos = clamp(viewXpos, viewBorder_w, room_width-viewBorder_w);
	viewYpos = clamp(viewYpos, viewBorder_h, room_height-viewBorder_h);
	if point_distance(view_x, view_y, viewXpos-((global.view_width_basic/global.view_zoom)/2), viewYpos-((global.view_height_basic/global.view_zoom)/2)) > 3{
	view_x = lerp(view_x, viewXpos-((global.view_width_basic/global.view_zoom)/2), viewFollowSpeed);
	view_y = lerp(view_y, viewYpos-((global.view_height_basic/global.view_zoom)/2), viewFollowSpeed);
	}
	
view_x = clamp(view_x, 0, room_width-global.cameraWidth);
view_y = clamp(view_y, 0, room_height-global.cameraHeight);
camera_set_view_pos(view_camera[view_index], view_x+viewSh_x, view_y+viewSh_y);
global.cameraXpos = camera_get_view_x(view_camera[view_index]);
global.cameraYpos = camera_get_view_y(view_camera[view_index]);

camera_set_view_border(view_camera[view_index], viewBorder_w, viewBorder_h);
camera_set_view_size(view_camera[view_index], global.view_width_basic/global.view_zoom, global.view_height_basic/global.view_zoom);
global.cameraWidth = camera_get_view_width(view_camera[view_index]);
global.cameraHeight = camera_get_view_height(view_camera[view_index]);