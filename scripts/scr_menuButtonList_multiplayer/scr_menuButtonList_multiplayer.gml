///@function 
function scr_menuButtonList_multiplayer(){
var switchTxt = "";
	switchTxt[0] = global.textData[? "switch_OFF"];
	switchTxt[1] = global.textData[? "switch_ON"];
var _buttonName, _buttonDesc, _buttonValue, _buttonIndex;
var _index = 0;
var _returnArr = 0;

	_buttonName[_index] = global.textData[? "b_createLobby"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_createLobby";
	_index ++;
	_buttonName[_index] = global.textData[? "b_searchLobby"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_searchLobby";
	_index ++;
	_buttonName[_index] = global.textData[? "b_enterLobby"];
	_buttonDesc[_index] = global.textData[? "bdesc_enterLobby"];
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_enterLobby";
	_index ++;
		
	_buttonName[_index] = global.textData[? "b_back"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_back";
	_index ++;
	
	
	_returnArr[0] = _buttonName;
	_returnArr[1] = _buttonDesc;
	_returnArr[2] = _buttonValue;
	_returnArr[3] = _buttonIndex;
	_returnArr[4] = _index;
	return(_returnArr);
}