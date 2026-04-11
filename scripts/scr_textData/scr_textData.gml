function scr_textData(argument0){ //Глобальная база данных текстовых значений
switch(argument0)
{
	case "init": //Общая инициализация. Вызывается один раз в Create глобального контроллера
		global.textData = ds_map_create();
		global.text_scaling = 1; //Общее значение скейлинга текста (Для компенсации несоответствий размеров разных шрифтов
		scr_textData("update_font"); //Сразу инициализирует шрифты
		scr_textData("update"); //Сразу инициализирует текст
	break;
	case "update_font": //Обновление шрифтов
		global.textData[? "mainFont"] = krabuler_font;
		global.textData[? "iconFont"] = icon_font;
		
		global.textData[? "defaultFont"] = global.textData[? "mainFont"];
	break;
	case "update": //Загрузка текста из внешних файлов		
		#region HEADER
		global.textData[? "newsMenuHeader"] = "НОВОСТИ";
		#endregion
		#region
		global.textData[? "comment_textCopied"] = "Скопировано в буфер обмена";
		#endregion
		#region BUTTON
		global.textData[? "b_openURL"] = scr_locStringFind("auxiliary_values","b_openURL");
		global.textData[? "ok"] = scr_locStringFind("auxiliary_values","ok");
		global.textData[? "yes"] = scr_locStringFind("auxiliary_values","yes");
		global.textData[? "no"] = scr_locStringFind("auxiliary_values","no");
		global.textData[? "switch_ON"] = scr_locStringFind("auxiliary_values","switch_ON");
		global.textData[? "switch_OFF"] = scr_locStringFind("auxiliary_values","switch_OFF");
		global.textData[? "b_continue"] = scr_locStringFind("auxiliary_values","b_continue");
		global.textData[? "b_save"] = scr_locStringFind("auxiliary_values","b_save");
		global.textData[? "b_menuExit"] = scr_locStringFind("auxiliary_values","b_menuExit");
		global.textData[? "b_exit"] = scr_locStringFind("auxiliary_values","b_exit");
		global.textData[? "b_newGame"] = scr_locStringFind("auxiliary_values","b_newGame");
		global.textData[? "b_settings"] = scr_locStringFind("auxiliary_values","b_settings");
		global.textData[? "b_add"] = scr_locStringFind("auxiliary_values","b_add");
		global.textData[? "b_creators"] = scr_locStringFind("auxiliary_values","b_creators");
		global.textData[? "b_lang"] = scr_locStringFind("auxiliary_values","b_lang");
		global.textData[? "b_dismode"] = scr_locStringFind("auxiliary_values","b_dismode");
		global.textData[? "b_dismode_1"] = scr_locStringFind("auxiliary_values","b_dismode_1");
		global.textData[? "b_dismode_2"] = scr_locStringFind("auxiliary_values","b_dismode_2");
		global.textData[? "b_dismode_3"] = scr_locStringFind("auxiliary_values","b_dismode_3");
		global.textData[? "b_vsync"] = scr_locStringFind("auxiliary_values","b_vsync");
		global.textData[? "b_snd"] = scr_locStringFind("auxiliary_values","b_snd");
		global.textData[? "b_snd_1"] = scr_locStringFind("auxiliary_values","b_snd_1");
		global.textData[? "b_snd_2"] = scr_locStringFind("auxiliary_values","b_snd_2");
		global.textData[? "b_snd_3"] = scr_locStringFind("auxiliary_values","b_snd_3");
		global.textData[? "b_snd_4"] = scr_locStringFind("auxiliary_values","b_snd_4");
		global.textData[? "b_optimalSound"] = scr_locStringFind("auxiliary_values","b_optimalSound");
		global.textData[? "b_back"] = scr_locStringFind("auxiliary_values","b_back");
		
		global.textData[? "b_createLobby"] = "СОЗДАТЬ ЛОББИ";
		global.textData[? "b_searchLobby"] = "ПОИСК ЛОББИ";
		global.textData[? "b_enterLobby"] = "ВОЙТИ В ЛОББИ";
		
		global.textData[? "bdesc_enterLobby"] = "Позволяет найти необходимое лобби по специальному ключу";
		global.textData[? "bdesc_optimalSound"] = scr_locStringFind("auxiliary_values","bdesc_optimalSound");
		#endregion
		#region OTHER
		global.textData[? "loadingNews"] = "Загружаем новости";
		#endregion
		#region LANGUAGE
		global.textData[? "b_lng_ru"] = scr_locStringFind("lang_values","b_lng_ru");
		global.textData[? "b_lng_eng"] = scr_locStringFind("lang_values","b_lng_eng");
		global.textData[? "b_lng_ptbr"] = scr_locStringFind("lang_values","b_lng_ptbr");
		global.textData[? "b_lng_deu"] = scr_locStringFind("lang_values","b_lng_deu");
		global.textData[? "b_lng_fra"] = scr_locStringFind("lang_values","b_lng_fra");
		global.textData[? "b_lng_ita"] = scr_locStringFind("lang_values","b_lng_ita");
		global.textData[? "b_lng_chs"] = scr_locStringFind("lang_values","b_lng_chs");
		#endregion
	break;
}
}