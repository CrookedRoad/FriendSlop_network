///@function scr_string_linebreak(string,scale,width)
function scr_string_linebreak(argument0, argument1, argument2){ //Форматирует строку, перенося ее в нужных местах в зависимости от выбранной ширины
var _string = argument0;
var _scale = argument1*global.text_scaling;
var _width = argument2;
	
var _returnString = "";
var _line = "";
	for(var _i=1; _i<=string_length(_string); _i++)
	{
	var lastchar = string_copy(_string, _i, 1);
		_returnString += lastchar;
		_line += lastchar;
		if lastchar == "\n" then _line = "";
		if lastchar == " " && (string_width(_line)*_scale) > (_width*global.text_scaling){
			_returnString += "\n";
			_line = "";
		}
	}
	
	return(_returnString);
}