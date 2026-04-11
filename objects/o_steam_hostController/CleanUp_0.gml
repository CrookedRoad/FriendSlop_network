/// @description leaving lobby
scr_steamLobby_leave();
if (buffer_exists(steam_sendBuffer)){
	buffer_delete(steam_sendBuffer);
}