function scr_globalGameParameters(argument0){
switch(argument0)
{
	case "init": //Инициализирует глобальные игровые параметры
		global.accept = false; //Необходимо для окон подтверждения действий
		global.mapInteract = true;
		global.playerCantMove = false;
		global.grabbingObject = 0;
		global.grabDistLimit = 100;
	break;
	case "default": //Возвращает параметры к дефолтным значениям (Для GUI End глобального контроллера)
		global.mapInteract = true;
		global.playerCantMove = false;
		global.grabbingObject = 0;
	break;
}

}