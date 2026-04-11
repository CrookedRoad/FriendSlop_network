if glob_alpha > 0.1{
var interact = false;
	if glob_alpha >= 1 then interact = true;
	
if (interact){
	if (global.controlsData[? "close"].prs){
		show = false;
		scr_soundPlay(snd_menuButtonSelect, global.globVol*global.intVol, 0, 0, 0, -1);
	}
}

var xx, yy, w, h, scale;
	scale = 0.8;
	xx = xpos;
	yy = ypos;
	w = 460*scale;
	h = 230*scale;
	draw_sprite_ext(s_custom_rectangle, 0, 0, 0, global.gui_width, global.gui_height, 0, c_black, glob_alpha*0.6);
	scr_draw_sprite_to_gui(banner, 0, xx+(w/2), yy-(h/2), scale, scale, 0, c_white, glob_alpha);
	var button = scr_draw_customButton(xx+(w/2)-18, yy-(h/2)+18, s_bannerCloseButton, 0, glob_alpha, interact, 25);
		if (button){
			show = false;
		}
		
	if bannerName != ""{
		scr_draw_text_to_gui(xx, yy-(h/2)-10, bannerName, 0.5, c_white, 0, glob_alpha, fa_center, fa_bottom, c_black, -1);
	}
	yy += (h/2)+25;
	
	if url != ""{
	var button = scr_draw_bannerButton(xx, yy, w-10, global.textData[? "b_openURL"], glob_alpha, interact, false);
		if (button){
		var useSteamOverlay = false;
		var link, linkNew, findKey;
			link = url;
			linkNew = "";
			findKey = "steam";
		var steamConnection = scr_steamConnection_check();
			if (steamConnection){
				linkNew = string_replace_all(link, findKey, "");
				if linkNew != link then useSteamOverlay = true;
			}
			
			if (useSteamOverlay){
				steam_activate_overlay_browser(url);
			} else{
				url_open(url);
			}
			scr_soundPlay(snd_menuButtonSelect, global.globVol*global.intVol, 0, 0, 0, -1);
		}
		yy += 40;
	}
	
	if clipboard != ""{
	var buttonInteract = true;
		if instance_exists(o_notification) then buttonInteract = false;
	var button = scr_draw_bannerButton(xx, yy, w-10, clipboard, glob_alpha, interact*buttonInteract, false);
		switch(button)
		{
			case 0:
				//scr_draw_cursor_text(global.textData[? "copy"]);
			break;
			case 1:
				clipboard_set_text(clipboard);
				scr_soundPlay(snd_menuButtonSelect, global.globVol*global.intVol, 0, 0, 0, -1);
				scr_callNotification(global.textData[? "comment_textCopied"], -1);
			break;
		}
		yy += 40;
	}
	
	if message_txt != ""{
		scr_draw_text_to_gui(xx, yy, message_txt, 0.24, c_white, 0, glob_alpha, fa_center, false, c_black, -1);
	}
}