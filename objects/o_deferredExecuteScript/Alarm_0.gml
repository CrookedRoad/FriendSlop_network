/// @description Выполнение скрипта
if actionScript != ""{
	if script_exists(asset_get_index(actionScript)){
	var _actionScript = asset_get_index(actionScript);
	var executeScript = _actionScript();
	} else{
		show_debug_message("deferredExecuteScript: undefined script");
	}
} else{
	show_debug_message("deferredExecuteScript: script not specified");
}