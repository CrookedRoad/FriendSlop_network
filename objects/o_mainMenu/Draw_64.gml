if !keyboardUse then selectedButton = -1;
selectedButtonIndex = "";
var switchTxt = "";
	switchTxt[0] = global.textData[? "switch_OFF"];
	switchTxt[1] = global.textData[? "switch_ON"];
	
if glob_alpha > 0{
var interact = false;
	if (glob_alpha >= 1 && alpha >= 1) then interact = true;
	if instance_exists(o_message_window) then interact = false;
	if instance_exists(o_waiting) then interact = false;
	if (resetProgress) then interact = false;

var buttonName, buttonDesc, buttonValue, buttonIndex;
var index = 0;
switch(section){
	case "menu":
	var buttonList = scr_menuButtonList_menu();
		prevSection = "";
		
		buttonName = buttonList[0];
		buttonDesc = buttonList[1];
		buttonValue = buttonList[2];
		buttonIndex = buttonList[3];
		index = buttonList[4];
	break;
	case "multiplayer":
	var buttonList = scr_menuButtonList_multiplayer();
		prevSection = "menu";
		
		buttonName = buttonList[0];
		buttonDesc = buttonList[1];
		buttonValue = buttonList[2];
		buttonIndex = buttonList[3];
		index = buttonList[4];
	break;
	case "settings":
	var buttonList = scr_menuButtonList_settings();
		prevSection = "menu";
		
		buttonName = buttonList[0];
		buttonDesc = buttonList[1];
		buttonValue = buttonList[2];
		buttonIndex = buttonList[3];
		index = buttonList[4];
	break;
	case "language":
	var buttonList = scr_menuButtonList_language();
		prevSection = "settings";
		
		buttonName = buttonList[0];
		buttonDesc = buttonList[1];
		buttonValue = buttonList[2];
		buttonIndex = buttonList[3];
		index = buttonList[4];
	break;
	case "sndSettings":
	var buttonList = scr_menuButtonList_sndSettings();
		prevSection = "settings";
		
		buttonName = buttonList[0];
		buttonDesc = buttonList[1];
		buttonValue = buttonList[2];
		buttonIndex = buttonList[3];
		index = buttonList[4];
	break;
}
switch(section)
{
	case "menu":
	case "settings":
	case "language":
	case "multiplayer":
	#region КЛАВИАТУРНОЕ УПРАВЛЕНИЕ МЕНЮ
		if (keyboardUse){
			if point_distance(mouseX, mouseY, global.gui_mouseX, global.gui_mouseY) > 20{
				keyboardUse = false;
				mouseX = global.gui_mouseX;
				mouseY = global.gui_mouseY;
			}
		}
		if keyboardControlDelay == 0{
			if (interact){
			if (global.controlsData[? "up"].hld){
				if selectedButton > 0{
					selectedButton --;
					keyboardUse = true;
					mouseX = global.gui_mouseX;
					mouseY = global.gui_mouseY;
				
					keyboardControlDelay = 1;
					scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);
				}
			}
			if (global.controlsData[? "down"].hld){
				if selectedButton < (array_length(buttonName)-1){
					selectedButton ++;
					keyboardUse = true;
					mouseX = global.gui_mouseX;
					mouseY = global.gui_mouseY;
					
					keyboardControlDelay = 1;
					scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);
				}
			}
			}
		} else{
			keyboardControlDelay -= 0.1;
		}
	#endregion
	
	var valueCounter = 0;
	var xx, yy, step;
		step = 40;
		xx = 30+(button_width/2);
		yy = global.gui_height_basic - (index*step) - 30;
		if array_length(buttonName) != 0{
			for(i=0; i<array_length(buttonName); i++)
			{
			var buttonAlpha = glob_alpha*alpha;
				if section == "language" && !langAvailable[i]{
					buttonAlpha *= 0.7;
				}
			var buttonX, buttonY;
				buttonX = xx+button_offset[i];
				buttonY = yy;
			var buttonActivate = false;
				if (keyboardUse){
					if selectedButton == i then buttonActivate = true;
				}
			var button = scr_draw_menuButton(buttonX, buttonY, button_width, buttonName[i], buttonAlpha, interact, buttonActivate);
				switch(button){
					case 0:
						if selectedButton != i{
							selectedButton = i;
						}
						if !keyboardUse{
							if selbut != i{
								selbut = i;
								scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);
							}
						}
					break;
					case 1:
						selectedButton = i;
						selectedButtonIndex = buttonIndex[i];
						button_valueAlpha[i] = 0;
						event_user(0);
					break;
				}
				if nextSection == "" && buttonValue[i] != ""{
					scr_draw_text_to_gui(xx+(button_width/2)+45, buttonY, buttonValue[i], 0.24, c_white, 0, buttonAlpha*button_valueAlpha[i], false, fa_center, global.colorData[? "textCol_2"], -1);
					valueCounter ++;
				}
				
				yy += step;
				if i == (array_length(buttonName)-2) then yy += 15;
			}
			if nextSection == "" && valueCounter != 0{
				scr_draw_sprite_to_gui(s_custom_rectangle, 0, xx+1+(button_width/2)+30, yy-(step*2)+1, 3, -((index-1)*step)+10, 0, global.colorData[? "textCol_2"], (glob_alpha*alpha));
				scr_draw_sprite_to_gui(s_custom_rectangle, 0, xx+(button_width/2)+30, yy-(step*2), 3, -((index-1)*step)+10, 0, c_white, (glob_alpha*alpha));
			}
			if selectedButton != -1{
				if buttonDesc[selectedButton] != ""{
				var xx, yy;
					xx = global.gui_width_basic/2;
					yy = global.gui_height_basic-30;
					scr_draw_text_to_gui(xx, yy, buttonDesc[selectedButton], 0.25, c_yellow, 0, (glob_alpha*alpha), fa_center, fa_bottom, c_black, -1);
				}
			}
		}
	break;
	case "sndSettings":
	var buttonAlpha = glob_alpha*alpha;
	var xx, yy, step;
		step = 50;
		xx = 30+(button_width/2);
		yy = global.gui_height_basic - (index*step) + 5;
		i = 0;
		#region КЛАВИАТУРНОЕ УПРАВЛЕНИЕ МЕНЮ
			if (keyboardUse){
				if point_distance(mouseX, mouseY, global.gui_mouseX, global.gui_mouseY) > 20{
					keyboardUse = false;
					mouseX = global.gui_mouseX;
					mouseY = global.gui_mouseY;
				}
			}
			if keyboardControlDelay == 0{
				if (interact){
				if (global.controlsData[? "up"].hld){
					if selectedButton > 0{
						selectedButton --;
						keyboardUse = true;
						mouseX = global.gui_mouseX;
						mouseY = global.gui_mouseY;
				
						keyboardControlDelay = 1;
						scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);
					}
				}
				if (global.controlsData[? "down"].hld){
					if selectedButton < 6{
						selectedButton ++;
						keyboardUse = true;
						mouseX = global.gui_mouseX;
						mouseY = global.gui_mouseY;
					
						keyboardControlDelay = 1;
						scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);
					}
				}
				
				if (global.controlsData[? "left"].hld){
					keyboardUse = true;
					mouseX = global.gui_mouseX;
					mouseY = global.gui_mouseY;
					keyboardControlDelay = 1;
					switch(selectedButton)
					{
						case 0: if global.globVol > 0{global.globVol -= 0.05; global.globVol = clamp(global.globVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
						case 1: if global.ambVol > 0{global.ambVol -= 0.05; global.ambVol = clamp(global.ambVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
						case 2: if global.intVol > 0{global.intVol -= 0.05; global.intVol = clamp(global.intVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
						case 3: if global.mscVol > 0{global.mscVol -= 0.05; global.mscVol = clamp(global.mscVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
					}
				}
				if (global.controlsData[? "right"].hld){
					keyboardUse = true;
					mouseX = global.gui_mouseX;
					mouseY = global.gui_mouseY;
					keyboardControlDelay = 1;
					switch(selectedButton)
					{
						case 0: if global.globVol < 1{global.globVol += 0.05; global.globVol = clamp(global.globVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
						case 1: if global.ambVol < 1{global.ambVol += 0.05; global.ambVol = clamp(global.ambVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
						case 2: if global.intVol < 1{global.intVol += 0.05; global.intVol = clamp(global.intVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
						case 3: if global.mscVol < 1{global.mscVol += 0.05; global.mscVol = clamp(global.mscVol, 0, 1); scr_soundPlay(snd_scrollBar, global.globVol*global.intVol, 0, 0, 0, -1);} break;
					}
				}
				}
			} else{
				keyboardControlDelay -= 0.1;
			}
		#endregion
		
	var barX, barY;
		barX = xx+button_offset[i];
		barY = yy;
	var buttonNameColor = c_white;
		if selectedButton == i then buttonNameColor = c_yellow;
		if scr_cursor_in_rectangle(barX-(button_width/2)-10, barY-10, barX+(button_width/2)+10, barY+10){if mouse_check_button_pressed(mb_left){amountBar_key[i] = true; scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);}}
		global.globVol = (scr_draw_scrollBar(barX, barY, button_width, buttonAlpha, global.globVol*100, 0, 100, amountBar_key[i]) / 100);
		if mouse_check_button_released(mb_left) then amountBar_key[i] = false;
	var amountTxt = string(round(global.globVol*100))+"%";
		if global.globVol <= 0 then amountTxt = global.textData[? "switch_OFF"];
		scr_draw_text_to_gui(barX+(button_width/2)+15, barY, amountTxt, 0.24, c_white, 0, buttonAlpha, false, fa_center,global.colorData[? "textCol_2"], -1);
		scr_draw_text_to_gui(barX-(button_width/2), barY-12, buttonName[i]+":", 0.24, buttonNameColor, 0, buttonAlpha, false, fa_bottom, global.colorData[? "textCol_2"], -1);
		i ++;  yy += step;
		
	var barX, barY;
		barX = xx+button_offset[i];
		barY = yy;
	var buttonNameColor = c_white;
		if selectedButton == i then buttonNameColor = c_yellow;
		if scr_cursor_in_rectangle(barX-(button_width/2)-10, barY-10, barX+(button_width/2)+10, barY+10){if mouse_check_button_pressed(mb_left){amountBar_key[i] = true; scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);}}
		global.ambVol = (scr_draw_scrollBar(barX, barY, button_width, buttonAlpha, global.ambVol*100, 0, 100, amountBar_key[i]) / 100);
		if mouse_check_button_released(mb_left) then amountBar_key[i] = false;
	var amountTxt = string(round(global.ambVol*100))+"%";
		if global.ambVol <= 0 then amountTxt = global.textData[? "switch_OFF"];
		scr_draw_text_to_gui(barX+(button_width/2)+15, barY, amountTxt, 0.24, c_white, 0, buttonAlpha, false, fa_center, global.colorData[? "textCol_2"], -1);
		scr_draw_text_to_gui(barX-(button_width/2), barY-12, buttonName[i]+":", 0.24, buttonNameColor, 0, buttonAlpha, false, fa_bottom, global.colorData[? "textCol_2"], -1);
		i ++;  yy += step;
		
	var barX, barY;
		barX = xx+button_offset[i];
		barY = yy;
	var buttonNameColor = c_white;
		if selectedButton == i then buttonNameColor = c_yellow;
		if scr_cursor_in_rectangle(barX-(button_width/2)-10, barY-10, barX+(button_width/2)+10, barY+10){if mouse_check_button_pressed(mb_left){amountBar_key[i] = true; scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);}}
		global.intVol = (scr_draw_scrollBar(barX, barY, button_width, buttonAlpha, global.intVol*100, 0, 100, amountBar_key[i]) / 100);
		if mouse_check_button_released(mb_left) then amountBar_key[i] = false;
	var amountTxt = string(round(global.intVol*100))+"%";
		if global.intVol <= 0 then amountTxt = global.textData[? "switch_OFF"];
		scr_draw_text_to_gui(barX+(button_width/2)+15, barY, amountTxt, 0.24, c_white, 0, buttonAlpha, false, fa_center, global.colorData[? "textCol_2"], -1);
		scr_draw_text_to_gui(barX-(button_width/2), barY-12, buttonName[i]+":", 0.24, buttonNameColor, 0, buttonAlpha, false, fa_bottom, global.colorData[? "textCol_2"], -1);
		i ++;  yy += step;
		
	var barX, barY;
		barX = xx+button_offset[i];
		barY = yy;
	var buttonNameColor = c_white;
		if selectedButton == i then buttonNameColor = c_yellow;
		if scr_cursor_in_rectangle(barX-(button_width/2)-10, barY-10, barX+(button_width/2)+10, barY+10){if mouse_check_button_pressed(mb_left){amountBar_key[i] = true; scr_soundPlay(snd_menuButton, global.globVol*global.intVol, 0, 0, 0, -1);}}
		global.mscVol = (scr_draw_scrollBar(barX, barY, button_width, buttonAlpha, global.mscVol*100, 0, 100, amountBar_key[i]) / 100);
		if mouse_check_button_released(mb_left) then amountBar_key[i] = false;
	var amountTxt = string(round(global.mscVol*100))+"%";
		if global.mscVol <= 0 then amountTxt = global.textData[? "switch_OFF"];
		scr_draw_text_to_gui(barX+(button_width/2)+15, barY, amountTxt, 0.24, c_white, 0, buttonAlpha, false, fa_center, global.colorData[? "textCol_2"], -1);
		scr_draw_text_to_gui(barX-(button_width/2), barY-12, buttonName[i]+":", 0.24, buttonNameColor, 0, buttonAlpha, false, fa_bottom, global.colorData[? "textCol_2"], -1);
		i ++;  yy += step;
		
	var buttonX, buttonY;
		buttonX = xx+button_offset[i];
		buttonY = yy;
	var buttonActivate = false;
		if selectedButton == i then buttonActivate = true;
	var button = scr_draw_menuButton(buttonX, buttonY, button_width, global.textData[? "b_optimalSound"], buttonAlpha, interact, buttonActivate);
		switch(button){
			case 0:
				scr_draw_text_to_gui(global.gui_width_basic/2, global.gui_height_basic-30, global.textData[? "bdesc_optimalSound"], 0.25, c_yellow, 0, (glob_alpha*alpha), fa_center, fa_bottom, c_black, -1);
				if selectedButton != i{
					selectedButton = i;
				}
			break;
			case 1:
				selectedButton = i;
				selectedButtonIndex = "b_optimalSound";
				event_user(0);
			break;
		}
		i ++;  yy += step-10;
		
	var buttonX, buttonY;
		buttonX = xx+button_offset[i];
		buttonY = yy;
	var buttonActivate = false;
		if selectedButton == i then buttonActivate = true;
	var button = scr_draw_menuButton(buttonX, buttonY, button_width, global.textData[? "b_back"], buttonAlpha, interact, buttonActivate);
		switch(button){
			case 0:
				if selectedButton != i{
					selectedButton = i;
				}
			break;
			case 1:
				selectedButton = i;
				selectedButtonIndex = "b_back";
				event_user(0);
			break;
		}
	break;
}


if (interact){
	if keyboard_check_pressed(vk_escape) || gamepad_button_check_pressed(global.gp_main, gp_face2){
		if prevSection != ""{
			nextSection = prevSection;
			sectionShow = false;
			scr_soundPlay(snd_menuButtonSelect, global.globVol*global.intVol, 0, 0, 0, -1);
			scr_gameSettings("save");
		}
	}
}
}