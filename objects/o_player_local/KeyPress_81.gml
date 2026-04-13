/// @description Отбросить голову
if instance_exists(o_steam_networkController){
	scr_steam_request(global.mp_lobby_host_id, packetType.playerSeparateHead_request);
} else{
	scr_char_separate_head();
}