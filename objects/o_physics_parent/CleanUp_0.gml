if network_id != -1{
if ds_exists(global.net_entities, ds_type_map){ //Удаление network_id из базы данных сущностей
	if ds_map_exists(global.net_entities, network_id){
		ds_map_delete(global.net_entities, network_id);
	}
}
}