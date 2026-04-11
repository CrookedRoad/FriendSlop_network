function scr_steam_init(){
global.networkConnection = os_is_network_connected();
global.appID = steam_get_app_id();
global.userName = "";
global.steamAPI = false;

global.buildType = "steam";
}