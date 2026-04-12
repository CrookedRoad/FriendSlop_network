///@function 
function scr_enum_init(){
enum packetType_host {
	ping,
	pong,
	getPlayers,
	playerSync
}
enum packetType_client {
	ping,
	pong,
	playerInit,
	playerSync
}

#macro FLAG_MOVING   1 //(1 << 0)
#macro FLAG_RUNNING  2 //(1 << 1)
#macro FLAG_CLIMBING 4 //(1 << 2)
#macro FLAG_PUSHING  8 //(1 << 3)
}