function scr_input_update_kb(){
if ds_exists(global.controlsData, ds_type_map){
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
		global.controlsData[? inputName].prs = keyboard_check_pressed(inputKey);
		global.controlsData[? inputName].hld = keyboard_check(inputKey);
		global.controlsData[? inputName].rls = keyboard_check_released(inputKey);
	}
	
	inputName = "mouse_l";
	inputKey = global.controlsData[? inputName].key;
	global.controlsData[? inputName].prs = mouse_check_button_pressed(inputKey);
	global.controlsData[? inputName].hld = mouse_check_button(inputKey);
	global.controlsData[? inputName].rls = mouse_check_button_released(inputKey);
	inputName = "mouse_r";
	inputKey = global.controlsData[? inputName].key;
	global.controlsData[? inputName].prs = mouse_check_button_pressed(inputKey);
	global.controlsData[? inputName].hld = mouse_check_button(inputKey);
	global.controlsData[? inputName].rls = mouse_check_button_released(inputKey);
	inputName = "mouse_m";
	inputKey = global.controlsData[? inputName].key;
	global.controlsData[? inputName].prs = mouse_check_button_pressed(inputKey);
	global.controlsData[? inputName].hld = mouse_check_button(inputKey);
	global.controlsData[? inputName].rls = mouse_check_button_released(inputKey);
	
	global.controlsData[? "mouse_wheelUP"].key = mouse_wheel_up();
	global.controlsData[? "mouse_wheelDOWN"].key = mouse_wheel_down();
}
}