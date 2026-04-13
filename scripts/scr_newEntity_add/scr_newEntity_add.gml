///@function scr_newEntity_add(inst)
function scr_newEntity_add(argument0){
var inst = argument0;
var netID = -1;
	if inst != -1{
	if ds_exists(global.net_entities, ds_type_map){
		if instance_exists(inst){
			netID = global.net_id_counter;
			inst.network_id = netID;
			global.net_entities[? inst.network_id] = inst;
			global.net_id_counter ++;
		}
	}
	}
	
	return(netID);
}