///@function 
function scr_menuButtonList_menu(){
var switchTxt = "";
	switchTxt[0] = global.textData[? "switch_OFF"];
	switchTxt[1] = global.textData[? "switch_ON"];
var _buttonName, _buttonDesc, _buttonValue, _buttonIndex;
var _index = 0;
var _returnArr = 0;

	_buttonName[_index] = global.textData[? "b_newGame"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_play";
	_index ++;
	_buttonName[_index] = global.textData[? "b_settings"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_settings";
	_index ++;
	_buttonName[_index] = global.textData[? "b_creators"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_creators";
	_index ++;
		
	_buttonName[_index] = global.textData[? "b_exit"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_exit";
	_index ++;
	
	
	_returnArr[0] = _buttonName;
	_returnArr[1] = _buttonDesc;
	_returnArr[2] = _buttonValue;
	_returnArr[3] = _buttonIndex;
	_returnArr[4] = _index;
	return(_returnArr);
}