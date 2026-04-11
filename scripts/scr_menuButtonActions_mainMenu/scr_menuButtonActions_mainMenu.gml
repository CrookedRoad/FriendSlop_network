function scr_menuButtonActions_mainMenu(){
switch(selectedButtonIndex)
{
	case "b_play": //Начать игру
		nextSection = "multiplayer";
		sectionShow = false;
		pressedButton = selectedButton;
	break;
	case "b_settings": //Настройки
		nextSection = "settings";
		sectionShow = false;
		pressedButton = selectedButton;
	break;
	case "b_creators": //Создатели
		/*
		instance_create_depth(0, 0, 0, o_creators);
		show = false;
		pressedButton = selectedButton;
		*/
	break;
	case "b_exit": //Выход
		game_end();
	break;
	case "b_back": //Назад
		if prevSection != ""{
			nextSection = prevSection;
			sectionShow = false;
			pressedButton = selectedButton;
			scr_gameSettings("save");
		}
	break;
}
}