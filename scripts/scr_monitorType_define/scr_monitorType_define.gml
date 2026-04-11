function scr_monitorType_define(){
var _w = display_get_width();
var _h = display_get_height();
var _ratio = _w / _h;

var _type = "Unknown";

// Сравниваем с погрешностью (на случай странных разрешений)
if (abs(_ratio - (16/9)) < 0.1){
    _type = "16:9 (Widescreen)";
	global.aspectRatio = 1;
} else if (abs(_ratio - (21/9)) < 0.1){
    _type = "21:9 (UltraWide)";
	global.aspectRatio = 2;
} else if (abs(_ratio - (4/3)) < 0.1){
    _type = "4:3 (Oldschool)";
	global.aspectRatio = 0;
} else if (_ratio > 2.5){
    _type = "32:9 (Super UltraWide)";
	global.aspectRatio = 3;
}

show_debug_message("Monitor type: " + _type);
}