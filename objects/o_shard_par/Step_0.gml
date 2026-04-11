switch(show)
{
	case true:
	if image_alpha < 1 then image_alpha += 0.1;
	break;
	case false:
	if image_alpha > 0 then image_alpha -= 0.01 else instance_destroy();
	break;
}

if dissapear_timer > 0 then dissapear_timer -- else show = false;