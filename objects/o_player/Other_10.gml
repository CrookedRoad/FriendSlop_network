/// @description Событие получения урона
if HP <= 0{
scr_char_crumbling();
var newSelf = instance_create_depth(spawnX, spawnY, depth, object_index);
	newSelf.ownerSteam_id = ownerSteam_id;
}