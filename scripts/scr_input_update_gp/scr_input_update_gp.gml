function scr_input_update_gp(){
if ds_exists(global.controlsData, ds_type_map){
var gp = global.gp_main;
var inputName = "";
var inputKey = 0;
var inputCount = 0;
var input;
	input[inputCount] = "left"; inputCount++;
	input[inputCount] = "right"; inputCount++;
	input[inputCount] = "up"; inputCount++;
	input[inputCount] = "down"; inputCount++;
	input[inputCount] = "confirm"; inputCount++;
	input[inputCount] = "close"; inputCount++;
	for(var _i=0; _i<inputCount; _i++)
	{
		inputName = input[_i];
		inputKey = global.controlsData[? inputName].key;
		global.controlsData[? inputName].prs = gamepad_button_check_pressed(gp, inputKey);
		global.controlsData[? inputName].hld = gamepad_button_check(gp, inputKey);
		global.controlsData[? inputName].rls = gamepad_button_check_released(gp, inputKey);
	}
}
}