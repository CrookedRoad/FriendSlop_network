///@function 
function scr_menuButtonList_settings(){
var switchTxt = "";
	switchTxt[0] = global.textData[? "switch_OFF"];
	switchTxt[1] = global.textData[? "switch_ON"];
var _buttonName, _buttonDesc, _buttonValue, _buttonIndex;
var _index = 0;
var _returnArr = 0;

	_buttonName[_index] = global.textData[? "b_lang"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	switch(lng)
	{
		case 0: _buttonValue[_index] = global.textData[? "b_lng_ru"]; break;
		case 1: _buttonValue[_index] = global.textData[? "b_lng_eng"]; break;
		case 2: _buttonValue[_index] = global.textData[? "b_lng_ptbr"]; break;
		case 3: _buttonValue[_index] = global.textData[? "b_lng_deu"]; break;
		case 4: _buttonValue[_index] = global.textData[? "b_lng_fra"]; break;
		case 5: _buttonValue[_index] = global.textData[? "b_lng_ita"]; break;
		case 6: _buttonValue[_index] = global.textData[? "b_lng_chs"]; break;
	}
	_buttonIndex[_index] = "b_lang";
	_index ++;
	_buttonName[_index] = global.textData[? "b_dismode"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	switch(screenMode){
		case 0: _buttonValue[_index] = global.textData[? "b_dismode_1"]; break;
		case 1: _buttonValue[_index] = global.textData[? "b_dismode_2"]; break;
		case 2: _buttonValue[_index] = global.textData[? "b_dismode_3"]; break;
	}
	_buttonIndex[_index] = "b_dismode";
	_index ++;
	_buttonName[_index] = global.textData[? "b_vsync"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = switchTxt[global.vSync];
	_buttonIndex[_index] = "b_vsync";
	_index ++;
	_buttonName[_index] = global.textData[? "b_snd"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_snd";
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