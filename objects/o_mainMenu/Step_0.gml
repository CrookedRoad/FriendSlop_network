if !instance_exists(o_room_goto){
var line = 0;
	for(i=0; i<button_limit; i++)
	{
	var n = 0;
		if selectedButton == i then n = 18;
		if pressedButton == i then n = 300;
		
		button_offset[line] = lerp(button_offset[line], n, 0.1);
		if button_offset[line] >= -50 then line ++;
		
		if button_valueAlpha[i] < 1 then button_valueAlpha[i] += 0.1;
	}
/*	
if keyboard_check_pressed(ord("N")){ //Открытие новостей
	if (global.news){
	if !instance_exists(o_gameNews_list){
		instance_create_depth(0, 0, 0, o_gameNews_list);
	}
	}
}
*/
}

switch(show){
	case true:
		if !instance_exists(o_room_goto){
			if glob_alpha < 1 then glob_alpha += 0.05;
		}
	break;
	case false:
		if glob_alpha > 0 then glob_alpha -= 0.05 else instance_destroy();
	break;
}

switch(sectionShow){
	case true:
		if alpha < 1 then alpha += 0.1;
	break;
	case false:
		if alpha > 0 then alpha -= 0.1 else event_user(1);
	break;
}