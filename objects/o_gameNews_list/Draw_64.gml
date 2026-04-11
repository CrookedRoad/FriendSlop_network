var interact = true;
	if glob_alpha < 1 then interact = false;
	if !isVisible then interact = false;
	if instance_exists(o_message_window) && !instance_exists(o_viewBanner_window) then interact = false;
	if instance_exists(o_waiting) then interact = false;
	
selectedBanner = -1; 
if ds_exists(bannerList, ds_type_list) && ds_exists(bannerData, ds_type_map){
var listSize = ds_list_size(bannerList);
var xx, yy, step, scale;
	scale = bannerData[? "scale"];
	step = 250*scale;
	stripYoffsetMax = step*listSize;
	xx = xpos;
	yy = ypos-stripYoffsetDraw;
	
	if (interact){
		if (global.controlsData[? "mouse_wheelUP"].key){
			stripYoffset -= step;
			stripYoffset = clamp(stripYoffset, 0, clamp(stripYoffsetMax-(step*5), 0, 10000));
		}
		if (global.controlsData[? "mouse_wheelDOWN"].key){
			stripYoffset += step;
			stripYoffset = clamp(stripYoffset, 0, clamp(stripYoffsetMax-(step*5), 0, 10000));
		}
	}
	for(i=0; i<listSize; i++)
	{
	var bannerKey = bannerList[| i];
		scr_draw_sprite_to_gui(bannerData[? bannerKey+"_sprite"], 0, xx-bannerXoffset[i], yy, scale, scale, 0, c_white, glob_alpha*bannerAlpha[i]);
		
		if (interact){
		if scr_cursor_in_rectangle(xx-(480*scale), yy, xx, yy+(232*scale)){
			if selbut != i{selbut = i; scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);}
			selectedBanner = i;
			if (global.controlsData[? "mouse_l"].rls){
			var changeBanner = true;
				if instance_exists(o_viewBanner_window){
					with(o_viewBanner_window){
						if key != bannerKey{
							show = false;
						} else{
							changeBanner = false;
						}
					}
				}
				if (changeBanner){
				var openWindow = instance_create_depth(0, 0, 0, o_viewBanner_window);
					openWindow.key = bannerKey;
					openWindow.banner = bannerData[? bannerKey+"_sprite"];
					if ds_map_exists(bannerData, bannerKey+"_name") then openWindow.bannerName = bannerData[? bannerKey+"_name"];
					if ds_map_exists(bannerData, bannerKey+"_message") then openWindow.message_txt = bannerData[? bannerKey+"_message"];
					if ds_map_exists(bannerData, bannerKey+"_URL") then openWindow.url = bannerData[? bannerKey+"_URL"];
					if ds_map_exists(bannerData, bannerKey+"_clipboard") then openWindow.clipboard = bannerData[? bannerKey+"_clipboard"];
					scr_soundPlay(snd_menuButtonSelect, global.globVol*global.intVol, 0, 0, 0, -1);
				}
			}
		}
		}
		
		yy += step;
	}
	if instance_exists(o_newsLoad){
		yy += 30;
		scr_draw_sprite_to_gui(s_loading_ico, 0, xx-((460*scale)/2)+1, yy+1, 0.075, 0.075, loadIcoAngle, c_black, glob_alpha);
		scr_draw_sprite_to_gui(s_loading_ico, 0, xx-((460*scale)/2), yy, 0.075, 0.075, loadIcoAngle, c_white, glob_alpha);
		scr_draw_text_to_gui(xx-((460*scale)/2), yy+25, loadTxt, 0.2, c_white, 0, glob_alpha, fa_center, fa_top, c_black, -1);
	}
	
var xx, yy;
	xx = global.gui_width_basic-138;
	yy = 30;
	scr_draw_sprite_to_gui(s_custom_fade_75x1, 0, global.gui_width_basic-200, yy-20, -2, 40, 0, headerBackColor, (glob_alpha*headerAlpha)*0.7);
	scr_draw_sprite_to_gui(s_custom_rectangle, 0, global.gui_width_basic-200, yy-20, 200, 40, 0, headerBackColor, (glob_alpha*headerAlpha)*0.7);
	scr_draw_text_to_gui(xx, yy, header, 0.5, c_white, 0, glob_alpha*headerAlpha, fa_center, fa_center, -1, -1);
	if !instance_exists(o_viewBanner_window){
	var button = scr_draw_customButton(global.gui_width_basic-20, yy, s_bannerCloseButton, 0, glob_alpha, interact, 25);
		if (button){
			show = false;
		}
	var button = scr_draw_customButton(global.gui_width_basic-50, yy, s_bannerUpdateButton, 0, glob_alpha, interact, 25);
		if (button){
			show = false;
			refreshNews = true;
		}
	}
}