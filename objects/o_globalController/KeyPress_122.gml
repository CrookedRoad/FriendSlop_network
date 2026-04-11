if keyboard_check(vk_shift){
	debugOverlay = !debugOverlay;
	show_debug_overlay(debugOverlay);
	/*
	switch(debugOverlay){
		case true:
			window_set_cursor(cr_default);
		break;
		case false:
			window_set_cursor(cr_none);
		break;
	}
	*/
} else{
	showGameInfo = !showGameInfo;
}