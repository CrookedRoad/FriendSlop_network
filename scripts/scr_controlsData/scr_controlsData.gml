function scr_controlsData(){ //Простая система обозначения клавиш
switch(argument0)
{
	case "init":
		global.controlsData = ds_map_create();
		global.controlSystem = "simple";
		scr_inputData("update");
	break;
	case "update":
		switch(global.gameControl)
		{
		case 0:
		global.controlsData[? "left"] = {key : ord("A"), key_string : "[A]"};
		global.controlsData[? "right"] = {key : ord("D"), key_string : "[D]"};
		global.controlsData[? "up"] = {key : ord("W"), key_string : "[W]"};
		global.controlsData[? "down"] = {key : ord("S"), key_string : "[S]"};
		
		global.controlsData[? "mouse_l"] = {key : mb_left, key_string : "[LMB]"};
		global.controlsData[? "mouse_r"] = {key : mb_right, key_string : "[RMB]"};
		global.controlsData[? "mouse_m"] = {key : mb_middle, key_string : "[MMB]"};
		break;
		case 1:
		global.controlsData[? "left"] = {key : gp_padl, key_string : "[PAD L]"};
		global.controlsData[? "right"] = {key : gp_padr, key_string : "[PAD R]"};
		global.controlsData[? "up"] = {key : gp_padu, key_string : "[PAD U]"};
		global.controlsData[? "down"] = {key : gp_padd, key_string : "[PAD D]"};
	
		global.controlsData[? "mouse_l"] = {key : gp_face1, key_string : "[A]"};
		global.controlsData[? "mouse_r"] = {key : gp_face2, key_string : "[B]"};
		global.controlsData[? "mouse_m"] = {key : gp_face4, key_string : "[Y]"};
		break;
		}
	break;
}
}