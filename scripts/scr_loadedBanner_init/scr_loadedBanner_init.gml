///@function scr_loadedBanner_init()
function scr_loadedBanner_init(){
global.news = true;
global.newsDirectory = ".news";

global.loadedBannerLimit = 10;
for(var _i=0; _i<global.loadedBannerLimit; _i++)
{
	global.loadedBanner_sprite[_i] = 0;
	global.loadedBanner_name[_i] = "";
	global.loadedBanner_message[_i] = "";
	global.loadedBanner_clipboard[_i] = "";
	global.loadedBanner_url[_i] = "";
}
}