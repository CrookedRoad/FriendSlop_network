if delay > 0 then delay --;
if bodyID != 0 && instance_exists(bodyID){
	
} else{
	if image_alpha > 0 then image_alpha -= 0.01 else{
		if image_alpha != -1{
			if instance_exists(o_steam_networkController) && network_id != -1{
				scr_entityDestroy_request(network_id);
			} else{
				instance_destroy();
			}
			
			image_alpha = -1;
		}
	}
}