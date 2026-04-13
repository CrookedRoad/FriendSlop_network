if ds_exists(global.net_entities, ds_type_map){
	ds_map_clear(global.net_entities);
	ds_map_destroy(global.net_entities);
}