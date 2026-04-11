function scr_windowMode(argument0){
	switch(argument0){
	    case 0:
			window_set_showborder(true);
	        window_set_fullscreen(false);
	        global.window_width = global.window_width_basic;
	        global.window_height = global.window_height_basic;
        
	        window_set_size(global.window_width, global.window_height);
			scr_deferredExecuteScript("scr_windowUpdate", 10);
	    break;
	    case 1:
	        global.window_width = global.display_width;
	        global.window_height = global.display_height;
			
			window_set_showborder(true);
	        window_set_fullscreen(true);
			scr_deferredExecuteScript("scr_windowUpdate", 10);
	    break;
	    case 2:
			window_set_showborder(false);
	        window_set_fullscreen(false);
	        global.window_width = global.display_width;
	        global.window_height = global.display_height;
        
	        window_set_size(global.window_width, global.window_height);
	        scr_deferredExecuteScript("scr_windowUpdate", 10);
	    break;
	}
}