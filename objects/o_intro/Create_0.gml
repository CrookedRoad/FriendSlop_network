if (skipIntro){
	ROOM = mainScreen_rm;
}

if (test_mode){
	ROOM = global.testRoom;
} else{
	/*
	if !file_exists(global.settingsDitectory+"/"+"settings.sav"){
		instance_create_depth(0, 0, 0, o_language_preset);
		instance_destroy();
	}
	*/
}

intro = false;

alarm[0] = 120;
if (skipIntro) then alarm[0] = 15;