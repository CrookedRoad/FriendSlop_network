/// @description 
if global.net_id_counter > 0{
if ds_exists(global.net_entities, ds_type_map){
	if ds_map_exists(global.net_entities, global.net_id_counter-1){
	var inst = global.net_entities[? global.net_id_counter-1];
		with(inst){
			instance_destroy();
		}
	}
}
}