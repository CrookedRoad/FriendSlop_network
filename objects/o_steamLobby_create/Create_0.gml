depth = -8000;
lobby_is_created = false;

switch(global.mp_lobbyType)
{
	case "public":
	steam_lobby_create(steam_lobby_type_public, global.mp_playerLimit);
	break;
	case "private":
	steam_lobby_create(steam_lobby_type_private, global.mp_playerLimit);
	break;
	case "friendsOnly":
	steam_lobby_create(steam_lobby_type_friends_only, global.mp_playerLimit);
	break;
}
