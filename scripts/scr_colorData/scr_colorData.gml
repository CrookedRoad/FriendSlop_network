function scr_colorData(){ //Глобальная база данных цветов. Вызывается один раз в Create глобального контроллера
global.colorData = ds_map_create();

global.colorData[? "cursorTextColor"] = c_white;

global.colorData[? "textCol_1"] = make_color_hex("D3C1AF");
global.colorData[? "textCol_2"] = make_color_hex("262223");
global.colorData[? "textCol_3"] = make_color_hex("85C0EE");

global.colorData[? "intCol_1"] = make_color_hex("1D1D25");
global.colorData[? "intCol_2"] = make_color_hex("2D333F");
global.colorData[? "intCol_3"] = make_color_hex("1D9BBB");
global.colorData[? "intCol_4"] = make_color_hex("BD968B");
global.colorData[? "intCol_5"] = make_color_hex("EE693E");
}