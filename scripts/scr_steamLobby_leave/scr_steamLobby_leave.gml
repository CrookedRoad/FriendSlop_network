function scr_steamLobby_leave(){
if global.mp_lobby_id != 0{
	steam_lobby_leave();
	scr_steamLobby_data("default");
	show_debug_message("You leaved from lobby.");
}
}