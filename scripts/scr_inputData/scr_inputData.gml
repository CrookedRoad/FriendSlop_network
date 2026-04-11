function scr_inputData(argument0){ //Продвинутая система обозначения клавиш
switch(argument0)
{
	case "init":
		global.controlsData = ds_map_create();
		global.controlSystem = "advanced";
		scr_inputData("update");
	break;
	case "update":
	switch(global.gameControl)
	{
		case 0:
		global.controlsData[? "left"] = {
			key_string : "[A]",
			key : ord("A"),
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "right"] = {
			key_string : "[D]",
			key : ord("D"),
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "up"] = {
			key_string : "[W]",
			key : ord("W"),
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "down"] = {
			key_string : "[S]",
			key : ord("S"),
			prs : false,
			hld : false,
			rls : false
		}
		
		global.controlsData[? "confirm"] = {
			key_string : "[ENTER]",
			key : vk_enter,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "close"] = {
			key_string : "[ESC]",
			key : vk_escape,
			prs : false,
			hld : false,
			rls : false
		}
		
		global.controlsData[? "mouse_l"] = {
			key_string : "[LMB]",
			key : mb_left,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "mouse_r"] = {
			key_string : "[RMB]",
			key : mb_right,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "mouse_m"] = {
			key_string : "[MMB]",
			key : mb_middle,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "mouse_wheelUP"] = {
			key_string : "[MW UP]",
			key : false
		}
		global.controlsData[? "mouse_wheelDOWN"] = {
			key_string : "[MW DOWN]",
			key : false
		}
		break;
		case 1:
		global.controlsData[? "left"] = {
			key_string : "[PAD L]",
			key : gp_padl,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "right"] = {
			key_string : "[PAD R]",
			key : gp_padr,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "up"] = {
			key_string : "[PAD U]",
			key : gp_padu,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "down"] = {
			key_string : "[PAD D]",
			key : gp_padd,
			prs : false,
			hld : false,
			rls : false
		}
		
		global.controlsData[? "confirm"] = {
			key_string : "[A]",
			key : gp_face1,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "close"] = {
			key_string : "[B]",
			key : gp_face2,
			prs : false,
			hld : false,
			rls : false
		}
		
		global.controlsData[? "mouse_l"] = {
			key_string : "[A]",
			key : gp_face1,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "mouse_r"] = {
			key_string : "[B]",
			key : gp_face2,
			prs : false,
			hld : false,
			rls : false
		}
		global.controlsData[? "mouse_m"] = {
			key_string : "[Y]",
			key : gp_face4,
			prs : false,
			hld : false,
			rls : false
		}
		break;
	}
	break;
}
}