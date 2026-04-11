if instance_exists(o_steam_clientController){
	with(o_steam_clientController){
		instance_destroy();
	}
}
if instance_exists(o_steam_hostController){
	with(o_steam_hostController){
		instance_destroy();
	}
}