function scr_embeddedBanners_init(){
var index = 0;
	bannerList[| index] = scr_codeName_generator(15);
	if lng == 0 then bannerData[? bannerList[| index]+"_sprite"] = s_earlyAccess_info_ru else bannerData[? bannerList[| index]+"_sprite"] = s_earlyAccess_info_eng;
	bannerData[? bannerList[| index]+"_name"] = scr_locStringFind("news_data","earlyAccess_name");
	bannerData[? bannerList[| index]+"_message"] = scr_locStringFind("news_data","earlyAccess_message");
	bannerData[? bannerList[| index]+"_URL"] = "https://vk.com/remzimamutov";
	bannerData[? bannerList[| index]+"_clipboard"] = "NN0BGHN8LP";
	index ++;
	
	loadedBannerPos = index;
	alarm[0] = 10;
}