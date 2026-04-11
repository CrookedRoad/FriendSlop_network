///@function scr_urlData_readFile(fname, section, index)
function scr_urlData_readFile(argument0, argument1, argument2){
var _section = argument1;
var _search = argument2;

var openSection = "";
switch(_section)
{
    case "language":
        if lng == 0{
            openSection = "russian";
        } else{
            openSection = "english";
        }
    break;
    case "URL":
        openSection = "URL";
    break;
    case "clipboard":
        openSection = "clipboard";
    break;
    case "date":
        openSection = "date";
    break;
}


var fname = argument0+".txt";
var path = global.newsDirectory;

if file_exists(path+"/"+string(fname)){
    ini_open(path+"/"+string(fname));
        var findstr = ini_read_string(openSection, string(_search), "");
    ini_close();
    return findstr;
} else{
    show_message("File not found");
    game_end();
}
}