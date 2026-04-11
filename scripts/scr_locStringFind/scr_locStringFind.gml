///@function scr_locStringFind(fname,string)
function scr_locStringFind(argument0, argument1){ //Поиск необходимых значений в файлах локализации
var search = argument1;
var langDir = scr_language_directory(lng);

var fname = argument0+".txt";
var path = global.locDirectory+"/"+string(langDir);

	if file_exists(path+"/"+string(fname)){
	    ini_open(path+"/"+string(fname));
	        var findstr = ini_read_string("data", string(search), "");
	    ini_close();
    
	    findstr = string_replace_all(findstr, "*", "\n"); //Позволяет обозначать перенос строки "*"
	    return findstr;
	} else{
	    show_message("Localization file not found "+string(fname));
	    game_end();
	}
}