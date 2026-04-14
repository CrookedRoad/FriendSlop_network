network_id = -1;
ownerSteam_id = -1;
if instance_exists(o_steam_networkController){
	ownerSteam_id = global.mp_lobby_host_id;
}

canGrab = true;
grab = false;
grabbingLerpSpeed = 0.25;
densityDefault = 0;
physics_init = true;

posX_target = x;
posY_target = y;
rotation_target = 0;
lerpSpeed = 0.5;