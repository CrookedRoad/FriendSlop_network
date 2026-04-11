switch(show){
	case true:
		if glob_alpha < 1 then glob_alpha += 0.05;
		ypos = lerp(ypos, yposBasic, 0.1);
	break;
	case false:
		if glob_alpha > 0 then glob_alpha -= 0.1 else instance_destroy();
		ypos = lerp(ypos, 0, 0.1);
	break;
}