if instance_exists(viewFollowTarget){
	if viewFollowTarget != o_player{
		global.playerCantMove = true;
		global.mapInteract = false;
	}
}

switch(viewBoard)
{
	case false:
		viewBoardAlpha = lerp(viewBoardAlpha, 0, 0.1);
	break;
	case true:
		viewBoardAlpha = lerp(viewBoardAlpha, 1, 0.1);
		global.playerCantMove = true;
		global.mapInteract = false;
	break;
}