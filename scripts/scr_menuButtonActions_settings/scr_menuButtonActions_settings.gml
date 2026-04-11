function scr_menuButtonActions_settings(){
switch(selectedButtonIndex)
{
	case "b_lang": //Выбор языка
		nextSection = "language";
		sectionShow = false;
		pressedButton = selectedButton;
	break;
	case "b_lngset_ru": //Смена языка
	case "b_lngset_eng":
	case "b_lngset_ptbr":
	case "b_lngset_deu":
	case "b_lngset_fra":
	case "b_lngset_ita":
	case "b_lng_chs":
		/*
		if selectedButton != lng{
		if !instance_exists(o_change_language){
			if (langAvailable[selectedButton]){
				lng = selectedButton;
				instance_create_depth(0, 0, 0, o_change_language);
				if prevSection != ""{
					nextSection = prevSection;
					sectionShow = false;
					pressedButton = selectedButton;
					scr_gameSettings_save();
				}
			} else{
				scr_callMessage(global.textData[? "msg_langUnavailable"], -1);
			}
		}
		}
		*/
	break;
	case "b_dismode": //Режим отображения
	    screenMode++;
	    if screenMode>2 then screenMode = 0;
	    scr_windowMode(screenMode);
	break;
	case "b_vsync": //Верт. синхронизация
		vSync = !vSync;
		display_reset(display_aa,vSync);
	break;
	case "b_snd": //Настройка звука
		nextSection = "sndSettings";
		sectionShow = false;
		pressedButton = selectedButton;
	break;
	case "b_optimalSound": //Оптимальный пресет звука
		global.globVol = 1;
		global.ambVol = 0.7;
		global.intVol = 0.4;
		global.mscVol = 0.5;
	break;
}
}