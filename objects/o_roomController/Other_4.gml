var _list = ds_list_create();
with(o_physics_parent){
	ds_list_add(_list, id);
}

ds_list_sort(_list, true);
for(var i=0; i<ds_list_size(_list); i++)
{
var inst = _list[| i];
	inst.network_id = global.net_id_counter;
	global.net_entities[? inst.network_id] = inst;
	global.net_id_counter ++;
}

ds_list_destroy(_list);
global.net_entities_init = true;