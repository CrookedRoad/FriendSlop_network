switch(show)
{
	case true:
		if alpha < 1 then alpha += aSpeed else{
			if ROOM != 0{
				room_goto(ROOM);
				ROOM = 0;
			}
			if delay > 0 then delay -- else{
				show = false;
			}
		}
	break;
	case false:
		if alpha > 0 then alpha -= dSpeed else instance_destroy();
	break;
}