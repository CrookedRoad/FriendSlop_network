///@function scr_banner_delete(key)
function scr_banner_delete(argument0){
var _key = argument0;
	if instance_exists(o_gameNews_list){
	with(o_gameNews_list){
		if ds_exists(bannerList, ds_type_list) && ds_exists(bannerData, ds_type_map){
		var listSize = ds_list_size(bannerList);
			for(var _i=0; _i<listSize; _i++)
			{
			var bannerKey = bannerList[| _i];
				if _key == bannerKey{
					if ds_map_exists(bannerData, bannerKey+"_sprite") then ds_map_delete(bannerData, bannerKey+"_sprite");
					if ds_map_exists(bannerData, bannerKey+"_name") then ds_map_delete(bannerData, bannerKey+"_name");
					if ds_map_exists(bannerData, bannerKey+"_message") then ds_map_delete(bannerData, bannerKey+"_message");
					if ds_map_exists(bannerData, bannerKey+"_URL") then ds_map_delete(bannerData, bannerKey+"_URL");
					if ds_map_exists(bannerData, bannerKey+"_clipboard") then ds_map_delete(bannerData, bannerKey+"_clipboard");
					
					ds_list_delete(bannerList, _i);
					return(1);
				}
			}
		}
	}
	}
}