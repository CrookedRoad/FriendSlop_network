///@function 
function scr_enum_init(){
enum packetType {
	ping,
	pong,
	getPlayers,
	playersInit,
	playerSync,
	playerDeath,
	playerSeparateHead_request,
	playerSeparateHead,
	playerAttachHead_request,
	playerAttachHead,
	entitySync,
	requestOwnership,
	informOwnership,
	returnOwnershipToHost
}

#macro FLAG_MOVING   1 //(1 << 0)
#macro FLAG_RUNNING  2 //(1 << 1)
#macro FLAG_CLIMBING 4 //(1 << 2)
#macro FLAG_PUSHING  8 //(1 << 3)
}