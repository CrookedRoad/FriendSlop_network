function scr_gameSettings(argument0){
switch(argument0)
{
	case "init": //Общая инициализация. Вызывается один раз в Create глобального контроллера
		global.settingsDitectory = ".settings"; //Директория сохранений игры
		global.locDirectory = "localization"; //Директория файлов локализации игры
		
		//Параметры звука с делением на отдельные громкости
		global.globVol = 1;
		global.ambVol = 1;
		global.intVol = 1;
		global.mscVol = 1;
		
		globalvar lng; //Язык игры
		lng = 0;
		
		globalvar screenMode; //Режим отображения
		screenMode = 2;
		scr_windowMode(screenMode);
		globalvar vSync; //Верт. синхронизация
		vSync = false;
		display_reset(display_aa,vSync);
	break;
	case "save": //Сохранение
	var _fname = global.settingsDitectory+"/"+"settings.sav";
		ini_open(_fname);
		var _section = "SOUND";
			ini_write_real(_section, "globVolume", global.globVol);
			ini_write_real(_section, "ambVolume", global.ambVol);
			ini_write_real(_section, "intVolume", global.intVol);
			ini_write_real(_section, "mscVolume", global.mscVol);
			
		var _section = "GRAPHICS";
			ini_write_real(_section, "screenMode", screenMode);
			ini_write_real(_section, "vSync", vSync);
		ini_close();
	break;
	case "load": //Загрузка
	var _fname = global.settingsDitectory+"/"+"settings.sav";
		if file_exists(_fname){
		ini_open(_fname);
		var _section = "SOUND";
			global.globVol = ini_read_real(_section, "globVolume", 1);
			global.ambVol = ini_read_real(_section, "ambVolume", 1);
			global.intVol = ini_read_real(_section, "intVolume", 1);
			global.mscVol = ini_read_real(_section, "mscVolume", 1);
			
		var _section = "GRAPHICS";
			screenMode = ini_read_real(_section, "screenMode", 2);
			scr_windowMode(screenMode);
			vSync = ini_read_real(_section, "vSync", false);
			display_reset(display_aa,vSync);
		ini_close();
		}
	break;
}
}