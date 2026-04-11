function scr_applicationSurface_resize(){
	surface_resize(application_surface, global.window_width, global.window_height);

	global.gui_width = global.window_width;
	global.gui_height = global.window_height;
	global.gui_scaling = global.gui_height/global.gui_height_basic;
	display_set_gui_size(global.gui_width,global.gui_height);
}