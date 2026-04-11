var _type = async_load[? "event_type"];

if (_type == "lobby_list"){
var _lb_count = steam_lobby_list_get_count();
    for (var i = 0; i < _lb_count; i++)
    {
    var _lb_ID = steam_lobby_list_get_lobby_id(i);
    var _lb_owner = steam_lobby_list_get_lobby_owner_id(i);
    var _lb_members_count = steam_lobby_list_get_lobby_member_count(i);
	var _lb_name = steam_lobby_list_get_data(i, "name");
	var _lb_key = steam_lobby_list_get_data(i, "key");
		if lobby_key != ""{
			if _lb_key == lobby_key{
				steam_lobby_join_id(_lb_ID);
				show_debug_message("Success: Lobby fith key find!");
				break;
			}
		} else{	
			if ds_exists(global.mp_lobby_list, ds_type_list){
			var lobbyData = {
				lb_id : _lb_ID,
				lb_name : _lb_name,
				lb_owner : _lb_owner,
				lb_members : _lb_members_count
				}
			
				ds_list_add(global.mp_lobby_list, lobbyData);
			}
			
			instance_destroy();
		}
    }
}

if (_type == "lobby_joined"){ //Вход в лобби
var success = async_load[? "success"];
    if (success) {
		global.mp_lobby_id = async_load[? "lobby_id"];
		global.mp_lobby_host_id = steam_lobby_get_owner_id();
		global.mp_lobby_userPermissions = "client";
		show_debug_message("Successfully connected to the lobby: " + string(global.mp_lobby_id));
		
        instance_create_depth(0, 0, 0, o_steam_clientController);
        lobby_is_found = true;
    } else {
        show_debug_message("Error: The lobby is full or no longer exists.");
    }
	
	instance_destroy();
}