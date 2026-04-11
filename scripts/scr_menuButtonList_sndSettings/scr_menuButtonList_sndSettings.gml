///@function 
function scr_menuButtonList_sndSettings(){
var switchTxt = "";
	switchTxt[0] = global.textData[? "switch_OFF"];
	switchTxt[1] = global.textData[? "switch_ON"];
var _buttonName, _buttonDesc, _buttonValue, _buttonIndex;
	_buttonName = 0;
	_buttonDesc = 0;
	_buttonValue = 0;
	_buttonIndex = 0;
var _index = 0;
var _returnArr = 0;

	_buttonName[_index] = global.textData[? "b_snd_1"];
	_index ++;
	_buttonName[_index] = global.textData[? "b_snd_2"];
	_index ++;
	_buttonName[_index] = global.textData[? "b_snd_3"];
	_index ++;
	_buttonName[_index] = global.textData[? "b_snd_4"];
	_index ++;
	_index ++;
	_index ++;
	
	
	_returnArr[0] = _buttonName;
	_returnArr[1] = _buttonDesc;
	_returnArr[2] = _buttonValue;
	_returnArr[3] = _buttonIndex;
	_returnArr[4] = _index;
	return(_returnArr);
}