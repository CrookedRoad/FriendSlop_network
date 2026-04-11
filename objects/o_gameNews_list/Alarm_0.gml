/// @description Добавление загруженных баннеров
if !instance_exists(o_newsLoad){
var index = loadedBannerPos;
	for(var _i=0; _i<global.loadedBannerLimit; _i++)
	{
		if global.loadedBanner_sprite[_i] != 0 && sprite_exists(global.loadedBanner_sprite[_i]){
			bannerList[| index] = scr_codeName_generator(15);
			bannerData[? bannerList[| index]+"_sprite"] = global.loadedBanner_sprite[_i];
			if global.loadedBanner_name[_i] != "" then bannerData[? bannerList[| index]+"_name"] = global.loadedBanner_name[_i];
			if global.loadedBanner_message[_i] != "" then bannerData[? bannerList[| index]+"_message"] = global.loadedBanner_message[_i];
			if global.loadedBanner_clipboard[_i] != "" then bannerData[? bannerList[| index]+"_clipboard"] = global.loadedBanner_clipboard[_i];
			if global.loadedBanner_url[_i] != "" then bannerData[? bannerList[| index]+"_URL"] = global.loadedBanner_url[_i];
			
			bannerAlpha[index] = 0;
			index ++;
		}
	}
}