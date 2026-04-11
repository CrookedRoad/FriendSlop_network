if ds_exists(bannerList, ds_type_list){
    for(i=0; i<ds_list_size(bannerList); i++){
        ds_list_delete(bannerList, i);
    }
    ds_list_clear(bannerList);
    ds_list_destroy(bannerList);
}
if ds_exists(bannerData, ds_type_map){
var key = ds_map_find_first(bannerData);
    for(i=0; i<ds_map_size(bannerData); i++)
    {
        ds_map_delete(bannerData, key);
        key = ds_map_find_next(bannerData, key);
    }
	
    ds_map_clear(bannerData);
    ds_map_destroy(bannerData);
}