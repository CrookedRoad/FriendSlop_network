///@function scr_deferredExecuteScript(scriptName, time)
function scr_deferredExecuteScript(argument0, argument1){
var _script = argument0;
var _time = argument1;
var callExecutor = instance_create_depth(0, 0, 0, o_deferredExecuteScript);
	with(callExecutor){
		actionScript = _script;
		alarm[0] = _time;
	}
}