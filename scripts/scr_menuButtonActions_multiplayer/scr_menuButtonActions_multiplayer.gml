function scr_menuButtonActions_multiplayer(){
switch(selectedButtonIndex)
{
	case "b_createLobby": //Создать лобби
		if !instance_exists(o_steamLobby_create){
			instance_create_depth(0, 0, 0, o_steamLobby_create);
		}
	break;
	case "b_searchLobby": //Найти лобби

	break;
	case "b_enterLobby": //Войти в лобби по ключу
		if !instance_exists(o_steamLobby_find){
		var clipboard = clipboard_get_text();
			if clipboard != ""{
			var key = string_replace_all(clipboard, "lobby_key_", "");
				if key != clipboard{
				var controller = instance_create_depth(0, 0, 0, o_steamLobby_find);
					controller.lobby_key = clipboard;
					show_debug_message("Success: Lobby key found!");
				} else{
					show_debug_message("Error: Lobby key not found.");
				}
			}
		}
	break;
}
}