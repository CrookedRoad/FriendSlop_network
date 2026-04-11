///@function scr_steam_get_achievement(ach_name)
function scr_steam_get_achievement(argument0){
var achName = argument0;
if (global.steamAPI){
	if !steam_get_achievement(achName){
		steam_set_achievement(achName);
		return(1);
	}
}

return(0);
}