///@function 
function scr_menuButtonList_language(){
var switchTxt = "";
	switchTxt[0] = global.textData[? "switch_OFF"];
	switchTxt[1] = global.textData[? "switch_ON"];
var _buttonName, _buttonDesc, _buttonValue, _buttonIndex;
var _index = 0;
var _returnArr = 0;

	_buttonName[_index] = global.textData[? "b_lng_ru"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_lngset_ru";
	_index ++;
	_buttonName[_index] = global.textData[? "b_lng_eng"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_lngset_eng";
	_index ++;
	_buttonName[_index] = global.textData[? "b_lng_ptbr"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_lngset_ptbr";
	_index ++;
	_buttonName[_index] = global.textData[? "b_lng_deu"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_lngset_deu";
	_index ++;
	_buttonName[_index] = global.textData[? "b_lng_fra"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_lngset_fra";
	_index ++;
	_buttonName[_index] = global.textData[? "b_lng_ita"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_lngset_ita";
	_index ++;
	_buttonName[_index] = global.textData[? "b_lng_chs"];
	_buttonDesc[_index] = "";
	_buttonValue[_index] = "";
	_buttonIndex[_index] = "b_lng_chs";
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