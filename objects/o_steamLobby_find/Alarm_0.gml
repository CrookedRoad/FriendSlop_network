/// @description Лобби не найдено за определенное время
if !lobby_is_found{
	show_debug_message("Error: The lobby is full or no longer exists.");
	instance_destroy();
}