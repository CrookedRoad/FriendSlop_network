///@function 
function scr_network_update(){
global.networkConnection = os_is_network_connected();

global.userName = "";
global.steamAPI = false;
if steam_initialised(){
    global.steamAPI = true;
	global.userName = steam_get_persona_name();
}
}