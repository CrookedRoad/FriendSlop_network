/// @description Событие получения урона
if HP <= 0{
scr_char_crumbling();
instance_destroy();
var newSelf = instance_create_depth(spawnX, spawnY, depth, object_index);
	newSelf.ownerSteam_id = ownerSteam_id;
	if object_index == o_player_local{
		scr_steam_request_all(packetType.playerDeath);
	}
}