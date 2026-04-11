global.gui_mouseX = device_mouse_x_to_gui(0);
global.gui_mouseY = device_mouse_y_to_gui(0);
global.mouseX = mouse_x;
global.mouseY = mouse_y;

if global.controlSystem == "advanced"{
switch(global.gameControl)
{
	case 0:
	scr_input_update_kb();
	break;
	case 1:
	scr_input_update_gp();
	break;
}
}